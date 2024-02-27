// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fluttertestexample/main.dart';

void main() {
  testWidgets('Counter increments, decrements, and reset smoke test', (WidgetTester tester) async {

    // Build our app and trigger a frame
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0
    expect(find.text('You have pushed the button this many times:'), findsOneWidget);
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the increment button and trigger a frame
    await tester.tap(find.widgetWithText(ElevatedButton, 'Increment'));
    await tester.pump();

    // Verify that our counter has incremented
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);

     // Tap the increment button again and trigger a frame
    await tester.tap(find.widgetWithText(ElevatedButton, 'Increment'));
    await tester.pump();

    // After second increment, counter should be 3 (1 + 2)
    expect(find.text('3'), findsOneWidget);

    // Tap the decrement button and trigger a frame
    await tester.tap(find.widgetWithText(ElevatedButton, 'Decrement'));
    await tester.pump();

    //Verify that our counter has decremented back to 1 (3-2)
    expect(find.text('1'), findsOneWidget);

    // Tap the decrement button and trigger a frame
    await tester.tap(find.widgetWithText(ElevatedButton, 'Decrement'));
    await tester.pump();

    //Verify that our counter has decremented back to 0
    expect(find.text('0'), findsOneWidget);

    // Tap the reset button and trigger a frame
    await tester.tap(find.widgetWithText(ElevatedButton, 'Reset'));
    await tester.pump();

    // Verify that our counter has resetted
    expect(find.text('0'), findsOneWidget);
  });

}
