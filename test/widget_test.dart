// This is a basic Flutter widget test for the BMI Calculator.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:p004/main.dart';

void main() {
  testWidgets('BMI Calculator smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const BMICalculatorApp());

    // Verify that the app loads successfully
    expect(find.byType(MaterialApp), findsOneWidget);

    // Verify that input fields are present.
    expect(find.text('Height (cm)'), findsOneWidget);
    expect(find.text('Weight (kg)'), findsOneWidget);
    expect(find.text('Age (years)'), findsOneWidget);

    // Verify that buttons are present.
    expect(find.text('Calculate'), findsOneWidget);
    expect(find.text('Reset'), findsOneWidget);

    // Verify that tabs are present.
    expect(find.text('Calculator'), findsOneWidget);
    expect(find.text('History'), findsOneWidget);
    expect(find.text('Analytics'), findsOneWidget);
  });

  testWidgets('BMI Calculator basic functionality test', (
    WidgetTester tester,
  ) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const BMICalculatorApp());

    // Verify that the app loads without errors
    expect(find.byType(MaterialApp), findsOneWidget);

    // Verify that we can find text fields
    expect(find.byType(TextField), findsNWidgets(3));

    // Verify that we can find buttons
    expect(find.text('Calculate'), findsOneWidget);
    expect(find.text('Reset'), findsOneWidget);
  });
}
