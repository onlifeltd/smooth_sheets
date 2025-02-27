// Mocks generated by Mockito 5.4.4 from annotations
// in smooth_sheets/test/src/stubbing.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;
import 'dart:ui' as _i14;

import 'package:flutter/cupertino.dart' as _i7;
import 'package:flutter/foundation.dart' as _i9;
import 'package:flutter/gestures.dart' as _i6;
import 'package:flutter/scheduler.dart' as _i10;
import 'package:flutter/src/animation/curves.dart' as _i15;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i16;
import 'package:smooth_sheets/src/foundation/sheet_activity.dart' as _i5;
import 'package:smooth_sheets/src/foundation/sheet_context.dart' as _i2;
import 'package:smooth_sheets/src/foundation/sheet_drag.dart' as _i11;
import 'package:smooth_sheets/src/foundation/sheet_extent.dart' as _i3;
import 'package:smooth_sheets/src/foundation/sheet_gesture_tamperer.dart'
    as _i13;
import 'package:smooth_sheets/src/foundation/sheet_physics.dart' as _i4;
import 'package:smooth_sheets/src/foundation/sheet_status.dart' as _i12;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeSheetContext_0 extends _i1.SmartFake implements _i2.SheetContext {
  _FakeSheetContext_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSheetMetrics_1 extends _i1.SmartFake implements _i3.SheetMetrics {
  _FakeSheetMetrics_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeExtent_2 extends _i1.SmartFake implements _i3.Extent {
  _FakeExtent_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSheetPhysics_3 extends _i1.SmartFake implements _i4.SheetPhysics {
  _FakeSheetPhysics_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSheetActivity_4<T extends _i3.SheetExtent> extends _i1.SmartFake
    implements _i5.SheetActivity<T> {
  _FakeSheetActivity_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDrag_5 extends _i1.SmartFake implements _i6.Drag {
  _FakeDrag_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTickerProvider_6 extends _i1.SmartFake
    implements _i7.TickerProvider {
  _FakeTickerProvider_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAnimation_7<T> extends _i1.SmartFake implements _i7.Animation<T> {
  _FakeAnimation_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTickerFuture_8 extends _i1.SmartFake implements _i7.TickerFuture {
  _FakeTickerFuture_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFuture_9<T> extends _i1.SmartFake implements _i8.Future<T> {
  _FakeFuture_9(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDiagnosticsNode_10 extends _i1.SmartFake
    implements _i7.DiagnosticsNode {
  _FakeDiagnosticsNode_10(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );

  @override
  String toString({
    _i9.TextTreeConfiguration? parentConfiguration,
    _i7.DiagnosticLevel? minLevel = _i7.DiagnosticLevel.info,
  }) =>
      super.toString();
}

class _FakeTicker_11 extends _i1.SmartFake implements _i10.Ticker {
  _FakeTicker_11(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );

  @override
  String toString({bool? debugIncludeStack = false}) => super.toString();
}

/// A class which mocks [SheetExtent].
///
/// See the documentation for Mockito's code generation for more information.
class MockSheetExtent extends _i1.Mock implements _i3.SheetExtent {
  @override
  _i2.SheetContext get context => (super.noSuchMethod(
        Invocation.getter(#context),
        returnValue: _FakeSheetContext_0(
          this,
          Invocation.getter(#context),
        ),
        returnValueForMissingStub: _FakeSheetContext_0(
          this,
          Invocation.getter(#context),
        ),
      ) as _i2.SheetContext);

  @override
  set currentDrag(_i11.SheetDragController? _currentDrag) => super.noSuchMethod(
        Invocation.setter(
          #currentDrag,
          _currentDrag,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i3.SheetMetrics get value => (super.noSuchMethod(
        Invocation.getter(#value),
        returnValue: _FakeSheetMetrics_1(
          this,
          Invocation.getter(#value),
        ),
        returnValueForMissingStub: _FakeSheetMetrics_1(
          this,
          Invocation.getter(#value),
        ),
      ) as _i3.SheetMetrics);

  @override
  _i12.SheetStatus get status => (super.noSuchMethod(
        Invocation.getter(#status),
        returnValue: _i12.SheetStatus.stable,
        returnValueForMissingStub: _i12.SheetStatus.stable,
      ) as _i12.SheetStatus);

  @override
  _i3.Extent get minExtent => (super.noSuchMethod(
        Invocation.getter(#minExtent),
        returnValue: _FakeExtent_2(
          this,
          Invocation.getter(#minExtent),
        ),
        returnValueForMissingStub: _FakeExtent_2(
          this,
          Invocation.getter(#minExtent),
        ),
      ) as _i3.Extent);

  @override
  _i3.Extent get maxExtent => (super.noSuchMethod(
        Invocation.getter(#maxExtent),
        returnValue: _FakeExtent_2(
          this,
          Invocation.getter(#maxExtent),
        ),
        returnValueForMissingStub: _FakeExtent_2(
          this,
          Invocation.getter(#maxExtent),
        ),
      ) as _i3.Extent);

  @override
  _i4.SheetPhysics get physics => (super.noSuchMethod(
        Invocation.getter(#physics),
        returnValue: _FakeSheetPhysics_3(
          this,
          Invocation.getter(#physics),
        ),
        returnValueForMissingStub: _FakeSheetPhysics_3(
          this,
          Invocation.getter(#physics),
        ),
      ) as _i4.SheetPhysics);

  @override
  _i5.SheetActivity<_i3.SheetExtent> get activity => (super.noSuchMethod(
        Invocation.getter(#activity),
        returnValue: _FakeSheetActivity_4<_i3.SheetExtent>(
          this,
          Invocation.getter(#activity),
        ),
        returnValueForMissingStub: _FakeSheetActivity_4<_i3.SheetExtent>(
          this,
          Invocation.getter(#activity),
        ),
      ) as _i5.SheetActivity<_i3.SheetExtent>);

  @override
  _i3.SheetMetrics get metrics => (super.noSuchMethod(
        Invocation.getter(#metrics),
        returnValue: _FakeSheetMetrics_1(
          this,
          Invocation.getter(#metrics),
        ),
        returnValueForMissingStub: _FakeSheetMetrics_1(
          this,
          Invocation.getter(#metrics),
        ),
      ) as _i3.SheetMetrics);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  void takeOver(_i3.SheetExtent? other) => super.noSuchMethod(
        Invocation.method(
          #takeOver,
          [other],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void updateGestureTamperer(_i13.SheetGestureTamperer? gestureTamperer) =>
      super.noSuchMethod(
        Invocation.method(
          #updateGestureTamperer,
          [gestureTamperer],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void updatePhysics(_i4.SheetPhysics? physics) => super.noSuchMethod(
        Invocation.method(
          #updatePhysics,
          [physics],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void applyNewContentSize(_i14.Size? contentSize) => super.noSuchMethod(
        Invocation.method(
          #applyNewContentSize,
          [contentSize],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void applyNewViewportDimensions(
    _i14.Size? size,
    _i7.EdgeInsets? insets,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #applyNewViewportDimensions,
          [
            size,
            insets,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void applyNewBoundaryConstraints(
    _i3.Extent? minExtent,
    _i3.Extent? maxExtent,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #applyNewBoundaryConstraints,
          [
            minExtent,
            maxExtent,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void markAsDimensionsWillChange() => super.noSuchMethod(
        Invocation.method(
          #markAsDimensionsWillChange,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void markAsDimensionsChanged() => super.noSuchMethod(
        Invocation.method(
          #markAsDimensionsChanged,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onDimensionsFinalized() => super.noSuchMethod(
        Invocation.method(
          #onDimensionsFinalized,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void beginActivity(_i5.SheetActivity<_i3.SheetExtent>? activity) =>
      super.noSuchMethod(
        Invocation.method(
          #beginActivity,
          [activity],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void goIdle() => super.noSuchMethod(
        Invocation.method(
          #goIdle,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void goBallistic(double? velocity) => super.noSuchMethod(
        Invocation.method(
          #goBallistic,
          [velocity],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void goBallisticWith(_i7.Simulation? simulation) => super.noSuchMethod(
        Invocation.method(
          #goBallisticWith,
          [simulation],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void settle() => super.noSuchMethod(
        Invocation.method(
          #settle,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i6.Drag drag(
    _i7.DragStartDetails? details,
    _i14.VoidCallback? dragCancelCallback,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #drag,
          [
            details,
            dragCancelCallback,
          ],
        ),
        returnValue: _FakeDrag_5(
          this,
          Invocation.method(
            #drag,
            [
              details,
              dragCancelCallback,
            ],
          ),
        ),
        returnValueForMissingStub: _FakeDrag_5(
          this,
          Invocation.method(
            #drag,
            [
              details,
              dragCancelCallback,
            ],
          ),
        ),
      ) as _i6.Drag);

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setPixels(double? pixels) => super.noSuchMethod(
        Invocation.method(
          #setPixels,
          [pixels],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void correctPixels(double? pixels) => super.noSuchMethod(
        Invocation.method(
          #correctPixels,
          [pixels],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i8.Future<void> animateTo(
    _i3.Extent? newExtent, {
    _i7.Curve? curve = _i7.Curves.easeInOut,
    Duration? duration = const Duration(milliseconds: 300),
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #animateTo,
          [newExtent],
          {
            #curve: curve,
            #duration: duration,
          },
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  void didUpdateMetrics() => super.noSuchMethod(
        Invocation.method(
          #didUpdateMetrics,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void didDragStart(_i11.SheetDragStartDetails? details) => super.noSuchMethod(
        Invocation.method(
          #didDragStart,
          [details],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void didDragEnd(_i11.SheetDragEndDetails? details) => super.noSuchMethod(
        Invocation.method(
          #didDragEnd,
          [details],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void didDragUpdateMetrics(_i11.SheetDragUpdateDetails? details) =>
      super.noSuchMethod(
        Invocation.method(
          #didDragUpdateMetrics,
          [details],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void didDragCancel() => super.noSuchMethod(
        Invocation.method(
          #didDragCancel,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void didOverflowBy(double? overflow) => super.noSuchMethod(
        Invocation.method(
          #didOverflowBy,
          [overflow],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addListener(_i14.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i14.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [SheetContext].
///
/// See the documentation for Mockito's code generation for more information.
class MockSheetContext extends _i1.Mock implements _i2.SheetContext {
  @override
  _i7.TickerProvider get vsync => (super.noSuchMethod(
        Invocation.getter(#vsync),
        returnValue: _FakeTickerProvider_6(
          this,
          Invocation.getter(#vsync),
        ),
        returnValueForMissingStub: _FakeTickerProvider_6(
          this,
          Invocation.getter(#vsync),
        ),
      ) as _i7.TickerProvider);

  @override
  double get devicePixelRatio => (super.noSuchMethod(
        Invocation.getter(#devicePixelRatio),
        returnValue: 0.0,
        returnValueForMissingStub: 0.0,
      ) as double);
}

/// A class which mocks [AnimationController].
///
/// See the documentation for Mockito's code generation for more information.
class MockAnimationController extends _i1.Mock
    implements _i7.AnimationController {
  @override
  double get lowerBound => (super.noSuchMethod(
        Invocation.getter(#lowerBound),
        returnValue: 0.0,
        returnValueForMissingStub: 0.0,
      ) as double);

  @override
  double get upperBound => (super.noSuchMethod(
        Invocation.getter(#upperBound),
        returnValue: 0.0,
        returnValueForMissingStub: 0.0,
      ) as double);

  @override
  _i7.AnimationBehavior get animationBehavior => (super.noSuchMethod(
        Invocation.getter(#animationBehavior),
        returnValue: _i7.AnimationBehavior.normal,
        returnValueForMissingStub: _i7.AnimationBehavior.normal,
      ) as _i7.AnimationBehavior);

  @override
  set duration(Duration? _duration) => super.noSuchMethod(
        Invocation.setter(
          #duration,
          _duration,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set reverseDuration(Duration? _reverseDuration) => super.noSuchMethod(
        Invocation.setter(
          #reverseDuration,
          _reverseDuration,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i7.Animation<double> get view => (super.noSuchMethod(
        Invocation.getter(#view),
        returnValue: _FakeAnimation_7<double>(
          this,
          Invocation.getter(#view),
        ),
        returnValueForMissingStub: _FakeAnimation_7<double>(
          this,
          Invocation.getter(#view),
        ),
      ) as _i7.Animation<double>);

  @override
  double get value => (super.noSuchMethod(
        Invocation.getter(#value),
        returnValue: 0.0,
        returnValueForMissingStub: 0.0,
      ) as double);

  @override
  set value(double? newValue) => super.noSuchMethod(
        Invocation.setter(
          #value,
          newValue,
        ),
        returnValueForMissingStub: null,
      );

  @override
  double get velocity => (super.noSuchMethod(
        Invocation.getter(#velocity),
        returnValue: 0.0,
        returnValueForMissingStub: 0.0,
      ) as double);

  @override
  bool get isAnimating => (super.noSuchMethod(
        Invocation.getter(#isAnimating),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  _i7.AnimationStatus get status => (super.noSuchMethod(
        Invocation.getter(#status),
        returnValue: _i7.AnimationStatus.dismissed,
        returnValueForMissingStub: _i7.AnimationStatus.dismissed,
      ) as _i7.AnimationStatus);

  @override
  bool get isDismissed => (super.noSuchMethod(
        Invocation.getter(#isDismissed),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  bool get isCompleted => (super.noSuchMethod(
        Invocation.getter(#isCompleted),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  void resync(_i7.TickerProvider? vsync) => super.noSuchMethod(
        Invocation.method(
          #resync,
          [vsync],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void reset() => super.noSuchMethod(
        Invocation.method(
          #reset,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i7.TickerFuture forward({double? from}) => (super.noSuchMethod(
        Invocation.method(
          #forward,
          [],
          {#from: from},
        ),
        returnValue: _FakeTickerFuture_8(
          this,
          Invocation.method(
            #forward,
            [],
            {#from: from},
          ),
        ),
        returnValueForMissingStub: _FakeTickerFuture_8(
          this,
          Invocation.method(
            #forward,
            [],
            {#from: from},
          ),
        ),
      ) as _i7.TickerFuture);

  @override
  _i7.TickerFuture reverse({double? from}) => (super.noSuchMethod(
        Invocation.method(
          #reverse,
          [],
          {#from: from},
        ),
        returnValue: _FakeTickerFuture_8(
          this,
          Invocation.method(
            #reverse,
            [],
            {#from: from},
          ),
        ),
        returnValueForMissingStub: _FakeTickerFuture_8(
          this,
          Invocation.method(
            #reverse,
            [],
            {#from: from},
          ),
        ),
      ) as _i7.TickerFuture);

  @override
  _i7.TickerFuture animateTo(
    double? target, {
    Duration? duration,
    _i7.Curve? curve = _i15.Curves.linear,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #animateTo,
          [target],
          {
            #duration: duration,
            #curve: curve,
          },
        ),
        returnValue: _FakeTickerFuture_8(
          this,
          Invocation.method(
            #animateTo,
            [target],
            {
              #duration: duration,
              #curve: curve,
            },
          ),
        ),
        returnValueForMissingStub: _FakeTickerFuture_8(
          this,
          Invocation.method(
            #animateTo,
            [target],
            {
              #duration: duration,
              #curve: curve,
            },
          ),
        ),
      ) as _i7.TickerFuture);

  @override
  _i7.TickerFuture animateBack(
    double? target, {
    Duration? duration,
    _i7.Curve? curve = _i15.Curves.linear,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #animateBack,
          [target],
          {
            #duration: duration,
            #curve: curve,
          },
        ),
        returnValue: _FakeTickerFuture_8(
          this,
          Invocation.method(
            #animateBack,
            [target],
            {
              #duration: duration,
              #curve: curve,
            },
          ),
        ),
        returnValueForMissingStub: _FakeTickerFuture_8(
          this,
          Invocation.method(
            #animateBack,
            [target],
            {
              #duration: duration,
              #curve: curve,
            },
          ),
        ),
      ) as _i7.TickerFuture);

  @override
  _i7.TickerFuture repeat({
    double? min,
    double? max,
    bool? reverse = false,
    Duration? period,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #repeat,
          [],
          {
            #min: min,
            #max: max,
            #reverse: reverse,
            #period: period,
          },
        ),
        returnValue: _FakeTickerFuture_8(
          this,
          Invocation.method(
            #repeat,
            [],
            {
              #min: min,
              #max: max,
              #reverse: reverse,
              #period: period,
            },
          ),
        ),
        returnValueForMissingStub: _FakeTickerFuture_8(
          this,
          Invocation.method(
            #repeat,
            [],
            {
              #min: min,
              #max: max,
              #reverse: reverse,
              #period: period,
            },
          ),
        ),
      ) as _i7.TickerFuture);

  @override
  _i7.TickerFuture fling({
    double? velocity = 1.0,
    _i7.SpringDescription? springDescription,
    _i7.AnimationBehavior? animationBehavior,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #fling,
          [],
          {
            #velocity: velocity,
            #springDescription: springDescription,
            #animationBehavior: animationBehavior,
          },
        ),
        returnValue: _FakeTickerFuture_8(
          this,
          Invocation.method(
            #fling,
            [],
            {
              #velocity: velocity,
              #springDescription: springDescription,
              #animationBehavior: animationBehavior,
            },
          ),
        ),
        returnValueForMissingStub: _FakeTickerFuture_8(
          this,
          Invocation.method(
            #fling,
            [],
            {
              #velocity: velocity,
              #springDescription: springDescription,
              #animationBehavior: animationBehavior,
            },
          ),
        ),
      ) as _i7.TickerFuture);

  @override
  _i7.TickerFuture animateWith(_i7.Simulation? simulation) =>
      (super.noSuchMethod(
        Invocation.method(
          #animateWith,
          [simulation],
        ),
        returnValue: _FakeTickerFuture_8(
          this,
          Invocation.method(
            #animateWith,
            [simulation],
          ),
        ),
        returnValueForMissingStub: _FakeTickerFuture_8(
          this,
          Invocation.method(
            #animateWith,
            [simulation],
          ),
        ),
      ) as _i7.TickerFuture);

  @override
  void stop({bool? canceled = true}) => super.noSuchMethod(
        Invocation.method(
          #stop,
          [],
          {#canceled: canceled},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  String toStringDetails() => (super.noSuchMethod(
        Invocation.method(
          #toStringDetails,
          [],
        ),
        returnValue: _i16.dummyValue<String>(
          this,
          Invocation.method(
            #toStringDetails,
            [],
          ),
        ),
        returnValueForMissingStub: _i16.dummyValue<String>(
          this,
          Invocation.method(
            #toStringDetails,
            [],
          ),
        ),
      ) as String);

  @override
  void addListener(_i14.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i14.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addStatusListener(_i7.AnimationStatusListener? listener) =>
      super.noSuchMethod(
        Invocation.method(
          #addStatusListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeStatusListener(_i7.AnimationStatusListener? listener) =>
      super.noSuchMethod(
        Invocation.method(
          #removeStatusListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i7.Animation<U> drive<U>(_i7.Animatable<U>? child) => (super.noSuchMethod(
        Invocation.method(
          #drive,
          [child],
        ),
        returnValue: _FakeAnimation_7<U>(
          this,
          Invocation.method(
            #drive,
            [child],
          ),
        ),
        returnValueForMissingStub: _FakeAnimation_7<U>(
          this,
          Invocation.method(
            #drive,
            [child],
          ),
        ),
      ) as _i7.Animation<U>);

  @override
  void didRegisterListener() => super.noSuchMethod(
        Invocation.method(
          #didRegisterListener,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void didUnregisterListener() => super.noSuchMethod(
        Invocation.method(
          #didUnregisterListener,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void clearListeners() => super.noSuchMethod(
        Invocation.method(
          #clearListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void clearStatusListeners() => super.noSuchMethod(
        Invocation.method(
          #clearStatusListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyStatusListeners(_i7.AnimationStatus? status) => super.noSuchMethod(
        Invocation.method(
          #notifyStatusListeners,
          [status],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [TickerFuture].
///
/// See the documentation for Mockito's code generation for more information.
class MockTickerFuture extends _i1.Mock implements _i7.TickerFuture {
  @override
  _i8.Future<void> get orCancel => (super.noSuchMethod(
        Invocation.getter(#orCancel),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  void whenCompleteOrCancel(_i14.VoidCallback? callback) => super.noSuchMethod(
        Invocation.method(
          #whenCompleteOrCancel,
          [callback],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i8.Stream<void> asStream() => (super.noSuchMethod(
        Invocation.method(
          #asStream,
          [],
        ),
        returnValue: _i8.Stream<void>.empty(),
        returnValueForMissingStub: _i8.Stream<void>.empty(),
      ) as _i8.Stream<void>);

  @override
  _i8.Future<void> catchError(
    Function? onError, {
    bool Function(Object)? test,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #catchError,
          [onError],
          {#test: test},
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<R> then<R>(
    _i8.FutureOr<R> Function(void)? onValue, {
    Function? onError,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #then,
          [onValue],
          {#onError: onError},
        ),
        returnValue: _i16.ifNotNull(
              _i16.dummyValueOrNull<R>(
                this,
                Invocation.method(
                  #then,
                  [onValue],
                  {#onError: onError},
                ),
              ),
              (R v) => _i8.Future<R>.value(v),
            ) ??
            _FakeFuture_9<R>(
              this,
              Invocation.method(
                #then,
                [onValue],
                {#onError: onError},
              ),
            ),
        returnValueForMissingStub: _i16.ifNotNull(
              _i16.dummyValueOrNull<R>(
                this,
                Invocation.method(
                  #then,
                  [onValue],
                  {#onError: onError},
                ),
              ),
              (R v) => _i8.Future<R>.value(v),
            ) ??
            _FakeFuture_9<R>(
              this,
              Invocation.method(
                #then,
                [onValue],
                {#onError: onError},
              ),
            ),
      ) as _i8.Future<R>);

  @override
  _i8.Future<void> timeout(
    Duration? timeLimit, {
    _i8.FutureOr<void> Function()? onTimeout,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #timeout,
          [timeLimit],
          {#onTimeout: onTimeout},
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<void> whenComplete(dynamic Function()? action) =>
      (super.noSuchMethod(
        Invocation.method(
          #whenComplete,
          [action],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
}

/// A class which mocks [Ticker].
///
/// See the documentation for Mockito's code generation for more information.
class MockTicker extends _i1.Mock implements _i10.Ticker {
  @override
  bool get muted => (super.noSuchMethod(
        Invocation.getter(#muted),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  set muted(bool? value) => super.noSuchMethod(
        Invocation.setter(
          #muted,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool get isTicking => (super.noSuchMethod(
        Invocation.getter(#isTicking),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  bool get isActive => (super.noSuchMethod(
        Invocation.getter(#isActive),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  bool get scheduled => (super.noSuchMethod(
        Invocation.getter(#scheduled),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  bool get shouldScheduleTick => (super.noSuchMethod(
        Invocation.getter(#shouldScheduleTick),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  _i7.TickerFuture start() => (super.noSuchMethod(
        Invocation.method(
          #start,
          [],
        ),
        returnValue: _FakeTickerFuture_8(
          this,
          Invocation.method(
            #start,
            [],
          ),
        ),
        returnValueForMissingStub: _FakeTickerFuture_8(
          this,
          Invocation.method(
            #start,
            [],
          ),
        ),
      ) as _i7.TickerFuture);

  @override
  _i7.DiagnosticsNode describeForError(String? name) => (super.noSuchMethod(
        Invocation.method(
          #describeForError,
          [name],
        ),
        returnValue: _FakeDiagnosticsNode_10(
          this,
          Invocation.method(
            #describeForError,
            [name],
          ),
        ),
        returnValueForMissingStub: _FakeDiagnosticsNode_10(
          this,
          Invocation.method(
            #describeForError,
            [name],
          ),
        ),
      ) as _i7.DiagnosticsNode);

  @override
  void stop({bool? canceled = false}) => super.noSuchMethod(
        Invocation.method(
          #stop,
          [],
          {#canceled: canceled},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void scheduleTick({bool? rescheduling = false}) => super.noSuchMethod(
        Invocation.method(
          #scheduleTick,
          [],
          {#rescheduling: rescheduling},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void unscheduleTick() => super.noSuchMethod(
        Invocation.method(
          #unscheduleTick,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void absorbTicker(_i10.Ticker? originalTicker) => super.noSuchMethod(
        Invocation.method(
          #absorbTicker,
          [originalTicker],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  String toString({bool? debugIncludeStack = false}) => super.toString();
}

/// A class which mocks [TickerProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockTickerProvider extends _i1.Mock implements _i7.TickerProvider {
  @override
  _i10.Ticker createTicker(_i10.TickerCallback? onTick) => (super.noSuchMethod(
        Invocation.method(
          #createTicker,
          [onTick],
        ),
        returnValue: _FakeTicker_11(
          this,
          Invocation.method(
            #createTicker,
            [onTick],
          ),
        ),
        returnValueForMissingStub: _FakeTicker_11(
          this,
          Invocation.method(
            #createTicker,
            [onTick],
          ),
        ),
      ) as _i10.Ticker);
}
