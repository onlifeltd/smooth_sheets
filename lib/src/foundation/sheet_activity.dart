import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

import 'sheet_drag.dart';
import 'sheet_extent.dart';
import 'sheet_physics.dart';
import 'sheet_status.dart';

@internal
@optionalTypeArgs
abstract class SheetActivity<T extends SheetExtent> {
  bool _disposed = false;
  bool get disposed {
    assert(!_mounted || !_disposed);
    return _disposed;
  }

  bool _mounted = false;
  bool get mounted {
    assert(!_mounted || !_disposed);
    return _mounted;
  }

  T? _owner;
  T get owner {
    assert(debugAssertMounted());
    return _owner!;
  }

  double get velocity => 0.0;

  SheetStatus get status;

  @mustCallSuper
  void init(T owner) {
    assert(_owner == null);
    assert(!_mounted);
    assert(!_disposed);

    _owner = owner;
    _mounted = true;
  }

  @mustCallSuper
  void updateOwner(T owner) {
    _owner = owner;
  }

  void dispose() {
    _mounted = false;
    _disposed = true;
  }

  /// Whether the sheet should ignore pointer events while performing
  /// this activity.
  bool get shouldIgnorePointer => false;

  bool isCompatibleWith(SheetExtent newOwner) => newOwner is T;

  void didChangeContentSize(Size? oldSize) {}

  void didChangeViewportDimensions(Size? oldSize, EdgeInsets? oldInsets) {}

  // TODO: Change `double?` to `Extent?`.
  void didChangeBoundaryConstraints(
    double? oldMinPixels,
    double? oldMaxPixels,
  ) {}

  void didFinalizeDimensions(
    Size? oldContentSize,
    Size? oldViewportSize,
    EdgeInsets? oldViewportInsets,
  ) {
    if (oldContentSize == null && oldViewportSize == null) {
      // The sheet was laid out, but not changed in size.
      return;
    }

    final metrics = owner.metrics;
    final oldPixels = metrics.pixels;
    final newInsets = metrics.viewportInsets;
    final oldInsets = oldViewportInsets ?? newInsets;
    final deltaInsetBottom = newInsets.bottom - oldInsets.bottom;

    switch (deltaInsetBottom) {
      case > 0:
        // Prevents the sheet from being pushed off the screen by the keyboard.
        final correction = min(0.0, metrics.maxViewPixels - metrics.viewPixels);
        owner
          ..setPixels(oldPixels + correction)
          ..didUpdateMetrics();

      case < 0:
        // Appends the delta of the bottom inset (typically the keyboard height)
        // to keep the visual sheet position unchanged.
        owner
          ..setPixels(min(
            oldPixels - deltaInsetBottom,
            owner.metrics.maxPixels,
          ))
          ..didUpdateMetrics();
    }

    owner.settle();
  }

  @protected
  bool debugAssertMounted() {
    assert(() {
      if (!mounted) {
        throw FlutterError(
          'A $runtimeType was used after being disposed, or '
          'before init() was called. Once you have called dispose() '
          'on a $runtimeType, it can no longer be used.',
        );
      }
      return true;
    }());
    return true;
  }

  @protected
  bool debugAssertNotDisposed() {
    assert(() {
      if (disposed) {
        throw FlutterError(
          'A $runtimeType was used after being disposed. Once you have '
          'called dispose() on a $runtimeType, it can no longer be used.',
        );
      }
      return true;
    }());
    return true;
  }
}

/// An activity that animates the [SheetExtent]'s `pixels` to a destination
/// position resolved by [destination], using the specified [curve] and
/// [duration].
///
/// This activity accepts the destination position as an [Extent], allowing
/// the concrete end position (in pixels) to be adjusted during the animation
/// in response to viewport changes, such as the appearance of the keyboard.
///
/// When the end position changes, this activity updates the [SheetExtent]'s
/// `pixels` to maintain the sheet's visual position (referred to as *p*).
/// In subsequent frames, the animated position is linearly interpolated
/// between *p* and the new destination.
@internal
class AnimatedSheetActivity extends SheetActivity
    with ControlledSheetActivityMixin {
  AnimatedSheetActivity({
    required this.destination,
    required this.duration,
    required this.curve,
  })  : _effectiveCurve = curve,
        assert(duration > Duration.zero);

  final Extent destination;
  final Duration duration;
  final Curve curve;

  late double _startPixels;
  Curve _effectiveCurve;

  @override
  void init(SheetExtent delegate) {
    super.init(delegate);
    _startPixels = owner.metrics.pixels;
  }

  @override
  AnimationController createAnimationController() {
    return AnimationController.unbounded(vsync: owner.context.vsync);
  }

  @override
  TickerFuture onAnimationStart() {
    return controller.animateTo(
      1.0,
      duration: duration,
      curve: curve,
    );
  }

  @override
  void onAnimationTick() {
    // The baseline may change during the animation, so we need to
    // interpolate the current pixels in absolute coordinates. This ensures
    // visual consistency regardless of baseline changes.
    final endPixels = destination.resolve(owner.metrics.contentSize);
    final progress = _effectiveCurve.transform(controller.value);
    owner
      ..setPixels(lerpDouble(_startPixels, endPixels, progress)!)
      ..didUpdateMetrics();
  }

  @override
  void onAnimationEnd() {
    owner.goBallistic(0);
  }

  @override
  void didFinalizeDimensions(
    Size? oldContentSize,
    Size? oldViewportSize,
    EdgeInsets? oldViewportInsets,
  ) {
    // TODO: DRY with other activities.
    // Appends the delta of the bottom inset (typically the keyboard height)
    // to keep the visual sheet position unchanged.
    final newInsets = owner.metrics.viewportInsets;
    final oldInsets = oldViewportInsets ?? newInsets;
    final deltaInsetBottom = newInsets.bottom - oldInsets.bottom;
    final newPixels = owner.metrics.pixels - deltaInsetBottom;
    owner
      ..setPixels(newPixels)
      ..didUpdateMetrics();

    if (oldContentSize == null) {
      return;
    }

    // TODO: Remove the following logic and start a settling activity instead.
    final oldEndPixels = destination.resolve(oldContentSize);
    final newEndPixels = destination.resolve(owner.metrics.contentSize);
    final progress = controller.value;
    if (oldEndPixels != newEndPixels && progress < 1) {
      // The gradient of the line passing through the point
      // (t=progress, newPixels) and (t=1.0, newEndPixels).
      final gradient = (newEndPixels - newPixels) / (1 - progress);
      // The new start position is the intersection of that line with t=0.
      _startPixels = newEndPixels - gradient;
      _effectiveCurve = Curves.linear;
    }
  }
}

@internal
class BallisticSheetActivity extends SheetActivity
    with ControlledSheetActivityMixin {
  BallisticSheetActivity({
    required this.simulation,
  });

  final Simulation simulation;
  // TODO: Use controller.value instead.
  late double _lastAnimatedValue;

  @override
  void init(SheetExtent delegate) {
    super.init(delegate);
    _lastAnimatedValue = controller.value;
  }

  @override
  AnimationController createAnimationController() {
    return AnimationController.unbounded(vsync: owner.context.vsync);
  }

  @override
  TickerFuture onAnimationStart() {
    return controller.animateWith(simulation);
  }

  @override
  void onAnimationTick() {
    if (mounted) {
      final oldPixels = owner.metrics.pixels;
      owner
        ..setPixels(oldPixels + controller.value - _lastAnimatedValue)
        ..didUpdateMetrics();
      _lastAnimatedValue = controller.value;
    }
  }

  @override
  void onAnimationEnd() {
    owner.goBallistic(0);
  }

  @override
  void didFinalizeDimensions(
    Size? oldContentSize,
    Size? oldViewportSize,
    EdgeInsets? oldViewportInsets,
  ) {
    if (oldContentSize == null &&
        oldViewportSize == null &&
        oldViewportInsets == null) {
      return;
    }

    final oldMetrics = owner.metrics.copyWith(
      contentSize: oldContentSize,
      viewportSize: oldViewportSize,
      viewportInsets: oldViewportInsets,
    );

    // TODO: DRY with other activities.
    // Appends the delta of the bottom inset (typically the keyboard height)
    // to keep the visual sheet position unchanged.
    final newInsets = owner.metrics.viewportInsets;
    final oldInsets = oldViewportInsets ?? newInsets;
    final deltaInsetBottom = newInsets.bottom - oldInsets.bottom;
    final newPixels = owner.metrics.pixels - deltaInsetBottom;
    owner
      ..setPixels(newPixels)
      ..didUpdateMetrics();

    if (owner.physics.findSettledExtent(velocity, oldMetrics) case final detent
        when detent.resolve(owner.metrics.contentSize) != newPixels) {
      owner.beginActivity(
        SettlingSheetActivity.withDuration(
          const Duration(milliseconds: 150),
          destination: detent,
        ),
      );
    }
  }
}

/// A [SheetActivity] that performs a settling motion in response to changes
/// in the viewport dimensions or content size.
///
/// This activity animates the sheet position to the [destination] with a
/// constant [velocity] until the destination is reached. Optionally, the
/// animation [duration] can be specified to explicitly control the time it
/// takes to reach the [destination]. In this case, the [velocity] is determined
/// based on the distance to the [destination] and the specified [duration].
///
/// When the concrete value of the [destination] changes due to viewport
/// metrics or content size changes, and the [duration] is specified,
/// the [velocity] is recalculated to ensure the animation duration remains
/// consistent.
@internal
class SettlingSheetActivity extends SheetActivity {
  /// Creates a settling activity that animates the sheet position to the
  /// [destination] with a constant [velocity].
  SettlingSheetActivity({
    required this.destination,
    required double velocity,
  })  : assert(velocity > 0),
        _velocity = velocity,
        duration = null;

  /// Creates a settling activity that animates the sheet position to the
  /// [destination] over the specified [duration].
  SettlingSheetActivity.withDuration(
    Duration this.duration, {
    required this.destination,
  }) : assert(duration > Duration.zero);

  /// The amount of time the animation should take to reach the destination.
  ///
  /// If `null`, the animation lasts until the destination is reached
  /// or this activity is disposed.
  final Duration? duration;

  /// The destination position to which the sheet should settle.
  final Extent destination;

  late final Ticker _ticker;

  /// The amount of time that has passed between the time the animation
  /// started and the most recent tick of the animation.
  var _elapsedDuration = Duration.zero;

  @override
  double get velocity => _velocity;
  late double _velocity;

  @override
  SheetStatus get status => SheetStatus.animating;

  @override
  void init(SheetExtent owner) {
    super.init(owner);
    _ticker = owner.context.vsync.createTicker(_tick)..start();
    _invalidateVelocity();
  }

  /// Updates the sheet position toward the destination based on the current
  /// [_velocity] and the time elapsed since the last frame.
  ///
  /// If the destination is reached, a ballistic activity is started with
  /// zero velocity to ensure consistency between the settled position
  /// and the current [SheetPhysics].
  void _tick(Duration elapsedDuration) {
    final elapsedFrameTime =
        (elapsedDuration - _elapsedDuration).inMicroseconds /
            Duration.microsecondsPerSecond;
    final destination = this.destination.resolve(owner.metrics.contentSize);
    final pixels = owner.metrics.pixels;
    final newPixels = destination > pixels
        ? min(destination, pixels + velocity * elapsedFrameTime)
        : max(destination, pixels - velocity * elapsedFrameTime);
    owner
      ..setPixels(newPixels)
      ..didUpdateMetrics();

    _elapsedDuration = elapsedDuration;

    if (newPixels == destination) {
      owner.goBallistic(0);
    }
  }

  @override
  void didFinalizeDimensions(
    Size? oldContentSize,
    Size? oldViewportSize,
    EdgeInsets? oldViewportInsets,
  ) {
    if (oldViewportInsets != null) {
      // TODO: DRY with other activities.
      // Appends the delta of the bottom inset (typically the keyboard height)
      // to keep the visual sheet position unchanged.
      final newInsets = owner.metrics.viewportInsets;
      final oldInsets = oldViewportInsets;
      final deltaInsetBottom = newInsets.bottom - oldInsets.bottom;
      final newPixels = owner.metrics.pixels - deltaInsetBottom;
      owner
        ..setPixels(newPixels)
        ..didUpdateMetrics();
    }

    _invalidateVelocity();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  /// Updates [_velocity] based on the remaining time and distance to the
  /// destination position.
  ///
  /// Make sure to call this method on initialization and whenever the
  /// destination changes due to the viewport size or content size changing.
  ///
  /// If the animation [duration] is not specified, this method preserves the
  /// current velocity.
  void _invalidateVelocity() {
    if (duration case final duration?) {
      final remainingSeconds = (duration - _elapsedDuration).inMicroseconds /
          Duration.microsecondsPerSecond;
      final destination = this.destination.resolve(owner.metrics.contentSize);
      final pixels = owner.metrics.pixels;
      _velocity = remainingSeconds > 0
          ? (destination - pixels).abs() / remainingSeconds
          : (destination - pixels).abs();
    }
  }
}

@internal
class IdleSheetActivity extends SheetActivity {
  @override
  SheetStatus get status => SheetStatus.stable;

  // TODO: Start a settling activity if the keyboard animation is running.
  // @override
  // void didFinalizeDimensions(
  //   Size? oldContentSize,
  //   Size? oldViewportSize,
  //   EdgeInsets? oldViewportInsets,
  // ) {
  // }
}

@internal
class DragSheetActivity extends SheetActivity
    with UserControlledSheetActivityMixin
    implements SheetDragControllerTarget {
  DragSheetActivity();

  @override
  VerticalDirection get dragAxisDirection => VerticalDirection.up;

  @override
  Offset computeMinPotentialDeltaConsumption(Offset delta) {
    final metrics = owner.metrics;

    switch (delta.dy) {
      case > 0:
        final draggableDistance = max(0.0, metrics.maxPixels - metrics.pixels);
        return Offset(delta.dx, min(draggableDistance, delta.dy));

      case < 0:
        final draggableDistance = max(0.0, metrics.pixels - metrics.minPixels);
        return Offset(delta.dx, max(-1 * draggableDistance, delta.dy));

      case _:
        return delta;
    }
  }

  @override
  void applyUserDragUpdate(SheetDragUpdateDetails details) {
    final physicsAppliedDelta =
        owner.physics.applyPhysicsToOffset(details.deltaY, owner.metrics);
    if (physicsAppliedDelta != 0) {
      owner
        ..setPixels(owner.metrics.pixels + physicsAppliedDelta)
        ..didDragUpdateMetrics(details);
    }

    final overflow =
        owner.physics.computeOverflow(details.deltaY, owner.metrics);
    if (overflow != 0) {
      owner.didOverflowBy(overflow);
    }
  }

  @override
  void applyUserDragEnd(SheetDragEndDetails details) {
    owner
      ..didDragEnd(details)
      ..goBallistic(details.velocityY);
  }

  @override
  void onDragCancel(SheetDragCancelDetails details) {
    owner
      ..didDragCancel()
      ..goBallistic(0);
  }
}

@internal
@optionalTypeArgs
mixin ControlledSheetActivityMixin<T extends SheetExtent> on SheetActivity<T> {
  late final AnimationController controller;

  final _completer = Completer<void>();
  Future<void> get done => _completer.future;

  @factory
  AnimationController createAnimationController();
  TickerFuture onAnimationStart();
  void onAnimationTick();
  void onAnimationEnd() {}

  @override
  double get velocity => controller.velocity;

  @override
  SheetStatus get status => SheetStatus.animating;

  @override
  void init(T delegate) {
    super.init(delegate);
    controller = createAnimationController()..addListener(onAnimationTick);
    // Won't trigger if we dispose 'animation' first.
    onAnimationStart().whenComplete(onAnimationEnd);
  }

  @override
  void dispose() {
    controller.dispose();
    _completer.complete();
    super.dispose();
  }
}

@internal
@optionalTypeArgs
mixin UserControlledSheetActivityMixin<T extends SheetExtent>
    on SheetActivity<T> {
  @override
  SheetStatus get status => SheetStatus.dragging;

  @override
  void didFinalizeDimensions(
    Size? oldContentSize,
    Size? oldViewportSize,
    EdgeInsets? oldViewportInsets,
  ) {
    assert(owner.metrics.hasDimensions);

    final newInsets = owner.metrics.viewportInsets;
    final oldInsets = oldViewportInsets ?? newInsets;
    final deltaInsetBottom = newInsets.bottom - oldInsets.bottom;
    // Appends the delta of the bottom inset (typically the keyboard height)
    // to keep the visual sheet position unchanged.
    owner
      ..setPixels(owner.metrics.pixels - deltaInsetBottom)
      ..didUpdateMetrics();
    // We don't call `goSettling` here because the user is still
    // manually controlling the sheet position.
  }
}
