import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:takharrujy/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Reset Form clears all fields', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Navigate to Create Project screen
    await tester.tap(find.text('Create'));
    await tester.pumpAndSettle();

    // Fill some data
    await tester.enterText(find.byKey(const Key('titleField')), 'Temporary Project');
    await tester.enterText(find.byKey(const Key('descriptionField')), 'Temporary description');
    await tester.pumpAndSettle();

    // Tap reset form
    final resetButton = find.byKey(const Key('resetFormButton'));
    await tester.ensureVisible(resetButton);
    await tester.tap(resetButton);
    await tester.pumpAndSettle();

    // Verify fields are cleared (using descendant check)
    expect(
      find.descendant(
        of: find.byKey(const Key('titleField')),
        matching: find.text('Temporary Project'),
      ),
      findsNothing,
    );

    expect(
      find.descendant(
        of: find.byKey(const Key('descriptionField')),
        matching: find.text('Temporary description'),
      ),
      findsNothing,
    );
  });
}
