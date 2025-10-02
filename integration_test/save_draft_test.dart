import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:takharrujy/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Save Draft shows confirmation', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Navigate to Create Project screen
    await tester.tap(find.text('Create'));
    await tester.pumpAndSettle();

    // Make sure button is visible before tapping
    final saveDraftButton = find.byKey(const Key('saveDraftButton'));
    await tester.ensureVisible(saveDraftButton);
    await tester.tap(saveDraftButton);
    await tester.pumpAndSettle();

    // Check success snackbar (use textContaining to avoid exact match issues)
    expect(find.textContaining('Draft saved successfully'), findsOneWidget);
  });
}
