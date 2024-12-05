import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:practice_flutter/test/test1.dart';

void main() {
  testWidgets('Counter increments when the button is pressed',
      (WidgetTester tester) async {
    // 1. Build the widget and trigger a frame
    await tester.pumpWidget(const Test1());

    // 2. Find initial widgets
    final counterTextFinder = find.byKey(const Key('counterValue'));
    final buttonFinder = find.text('Increment');

    // 3. Verify the initial counter value is 0
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // 4. Tap the 'Increment' button and rebuild the widget
    await tester.tap(buttonFinder);
    await tester.pump(); // Rebuilds the widget tree

    // 5. Verify the counter has incremented to 1
    expect(find.text('1'), findsOneWidget);
    expect(find.text('0'), findsNothing);
  });
}
