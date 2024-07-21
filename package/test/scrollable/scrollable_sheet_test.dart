import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smooth_sheets/smooth_sheets.dart';
import 'package:smooth_sheets/src/foundation/sheet_controller.dart';

import '../src/keyboard_inset_simulation.dart';

class _TestApp extends StatelessWidget {
  const _TestApp({
    this.useMaterial = false,
    required this.child,
  });

  final bool useMaterial;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (useMaterial) {
      return MaterialApp(
        home: child,
      );
    } else {
      return Directionality(
        textDirection: TextDirection.ltr,
        child: MediaQuery(
          data: const MediaQueryData(),
          child: child,
        ),
      );
    }
  }
}

class _TestSheetContent extends StatelessWidget {
  const _TestSheetContent({
    super.key,
    this.height = 500,
    this.itemCount = 30,
    // Disable the snapping effect by default in tests.
    this.scrollPhysics = const ClampingScrollPhysics(),
    this.onTapItem,
  });

  final double? height;
  final int itemCount;
  final ScrollPhysics? scrollPhysics;
  final void Function(int index)? onTapItem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Material(
        color: Colors.white,
        child: ListView(
          physics: scrollPhysics,
          children: List.generate(
            itemCount,
            (index) => ListTile(
              title: Text('Item $index'),
              onTap: onTapItem != null ? () => onTapItem!(index) : null,
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  testWidgets('Inherited controller should be attached', (tester) async {
    final controller = SheetController();
    await tester.pumpWidget(
      SheetControllerScope(
        controller: controller,
        child: const _TestApp(
          child: ScrollableSheet(
            child: _TestSheetContent(),
          ),
        ),
      ),
    );

    expect(controller.hasClient, isTrue,
        reason: 'The controller should have a client.');
  });

  // Regression test for https://github.com/fujidaiti/smooth_sheets/issues/14
  testWidgets('Opening keyboard does not interrupt sheet animation',
      (tester) async {
    final controller = SheetController();
    final sheetKey = GlobalKey();
    final keyboardSimulationKey = GlobalKey<KeyboardInsetSimulationState>();

    await tester.pumpWidget(
      _TestApp(
        useMaterial: true,
        child: KeyboardInsetSimulation(
          key: keyboardSimulationKey,
          keyboardHeight: 200,
          child: ScrollableSheet(
            key: sheetKey,
            controller: controller,
            minExtent: const Extent.pixels(200),
            initialExtent: const Extent.pixels(200),
            child: const _TestSheetContent(height: 500),
          ),
        ),
      ),
    );

    expect(controller.value.pixels, 200,
        reason: 'The sheet should be at the initial extent.');
    expect(controller.value.minPixels < controller.value.maxPixels, isTrue,
        reason: 'The sheet should be draggable.');

    // Start animating the sheet to the max extent.
    unawaited(
      controller.animateTo(
        const Extent.proportional(1),
        duration: const Duration(milliseconds: 250),
      ),
    );
    // Then, show the keyboard while the sheet is animating.
    unawaited(
      keyboardSimulationKey.currentState!
          .showKeyboard(const Duration(milliseconds: 250)),
    );
    await tester.pumpAndSettle();
    expect(MediaQuery.viewInsetsOf(sheetKey.currentContext!).bottom, 200,
        reason: 'The keyboard should be fully shown.');
    expect(
      controller.value.pixels,
      controller.value.maxPixels,
      reason: 'After the keyboard is fully shown, '
          'the entire sheet should also be visible.',
    );
  });

  // Regression test for https://github.com/fujidaiti/smooth_sheets/issues/190
  testWidgets(
    'Press and hold scrollable view should stop momentum scrolling',
    (tester) async {
      const targetKey = Key('Target');
      final controller = SheetController();
      late ScrollController scrollController;

      await tester.pumpWidget(
        _TestApp(
          child: ScrollableSheet(
            controller: controller,
            child: Builder(
              builder: (context) {
                // TODO(fujita): Refactor this line after #116 is resolved.
                scrollController = PrimaryScrollController.of(context);
                return _TestSheetContent(
                  key: targetKey,
                  itemCount: 1000,
                  height: null,
                  // The items need to be clickable to cause the reported issue.
                  onTapItem: (index) {},
                );
              },
            ),
          ),
        ),
      );

      const dragDistance = 200.0;
      const flingSpeed = 2000.0;
      await tester.fling(
        find.byKey(targetKey),
        const Offset(0, -1 * dragDistance), // Fling up
        flingSpeed,
      );

      final offsetAfterFling = scrollController.offset;
      // Don't know why, but we need to call `pump` at least 2 times
      // to forward the animation clock.
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 250));
      final offsetBeforePress = scrollController.offset;
      expect(offsetBeforePress, greaterThan(offsetAfterFling),
          reason: 'Momentum scrolling should be in progress.');

      // Press and hold the finger on the target widget.
      await tester.press(find.byKey(targetKey));
      // Wait for the momentum scrolling to stop.
      await tester.pumpAndSettle();
      final offsetAfterPress = scrollController.offset;
      expect(
        offsetAfterPress,
        equals(offsetBeforePress),
        reason: 'Momentum scrolling should be stopped immediately'
            'by pressing and holding.',
      );
    },
  );

  group('SheetKeyboardDismissible', () {
    late FocusNode focusNode;
    late Widget testWidget;

    setUp(() {
      focusNode = FocusNode();
      testWidget = _TestApp(
        useMaterial: true,
        child: SheetKeyboardDismissible(
          dismissBehavior: const SheetKeyboardDismissBehavior.onDrag(
            isContentScrollAware: true,
          ),
          child: ScrollableSheet(
            child: Material(
              child: Column(
                children: [
                  TextField(focusNode: focusNode),
                  Expanded(
                    child: ListView(
                      children: List.generate(
                        30,
                        (index) => ListTile(
                          title: Text('Item $index'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });

    tearDown(() {
      focusNode.dispose();
    });

    testWidgets('should dismiss the keyboard when dragging', (tester) async {
      await tester.pumpWidget(testWidget);

      await tester.showKeyboard(find.byType(TextField));
      expect(focusNode.hasFocus, isTrue,
          reason: 'The keyboard should be shown.');

      await tester.drag(find.byType(ListView), const Offset(0, 40));
      await tester.pumpAndSettle();
      expect(focusNode.hasFocus, isFalse,
          reason: 'Downward dragging should dismiss the keyboard.');
    });

    testWidgets('should dismiss the keyboard when scrolling', (tester) async {
      await tester.pumpWidget(testWidget);

      final textField = find.byType(TextField).first;
      await tester.showKeyboard(textField);
      expect(focusNode.hasFocus, isTrue,
          reason: 'The keyboard should be shown.');

      await tester.drag(find.byType(ListView), const Offset(0, -40));
      await tester.pumpAndSettle();
      expect(focusNode.hasFocus, isFalse,
          reason: 'Upward scrolling should dismiss the keyboard.');
    });
  });
}
