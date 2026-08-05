import 'package:ecommerce_app3/main_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Counter Widget Tests', () {
    testWidgets('Initial counter value is 0', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);
    });

    testWidgets('Counter increments when button is tapped', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.byKey(const Key('incrementButton')));
      await tester.pump();

      expect(find.text('1'), findsOneWidget);
      expect(find.text('0'), findsNothing);
    });

    testWidgets('AppBar title is displayed', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      expect(find.text('Counter App'), findsOneWidget);
    });
  });
}
