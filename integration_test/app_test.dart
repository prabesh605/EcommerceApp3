import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Counter Integration Test', () {
    testWidgets('Increment counter', (WidgetTester tester) async {
      // Launch the app
      main();

      // Wait for the app to load
      await tester.pumpAndSettle();

      // Verify initial state
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      // Tap the FloatingActionButton
      await tester.tap(find.byKey(const Key('incrementButton')));

      // Wait for UI update
      await tester.pumpAndSettle();

      // Verify updated state
      expect(find.text('1'), findsOneWidget);
      expect(find.text('0'), findsNothing);
    });
  });
}
