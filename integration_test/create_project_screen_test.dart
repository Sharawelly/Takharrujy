import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:takharrujy/main.dart' as app;

void main() {
      IntegrationTestWidgetsFlutterBinding.ensureInitialized();

      group('Create Project Flow', () {
            testWidgets('User opens app and creates new project',
                    (WidgetTester tester) async {
                      // Step 1: Run the app
                      app.main();
                      await tester.pumpAndSettle();

                      // Step 2: Navigate to Create Project screen
                      await tester.tap(find.text('Create'));
                      await tester.pumpAndSettle();

                      // Step 3: Fill the form
                      await tester.ensureVisible(find.byKey(const Key('titleField')));
                      await tester.enterText(
                          find.byKey(const Key('titleField')), 'My Graduation Project');

                      await tester.ensureVisible(find.byKey(const Key('descriptionField')));
                      await tester.enterText(
                          find.byKey(const Key('descriptionField')),
                          'This is a test project, and i should complete 50 character');

                      // Select Supervisor
                      await tester.ensureVisible(find.byKey(const Key('supervisorDropdown')));
                      await tester.tap(find.byKey(const Key('supervisorDropdown')));
                      await tester.pumpAndSettle(); // Wait for dropdown to open

                      // Make sure this supervisor actually exists in your list
                      await tester.tap(find.text('Dr. Smith').last);
                      await tester.pumpAndSettle();

                      // Select Category
                      await tester.ensureVisible(find.byKey(const Key('categoryDropdown')));
                      await tester.tap(find.byKey(const Key('categoryDropdown')));
                      await tester.pumpAndSettle();

                      await tester.tap(find.text('Software Engineering').last);
                      await tester.pumpAndSettle();

                      // Set start and end dates
                      await tester.ensureVisible(find.byKey(const Key('startDateField')));
                      await tester.enterText(
                          find.byKey(const Key('startDateField')), '2025-10-01');

                      await tester.ensureVisible(find.byKey(const Key('endDateField')));
                      await tester.enterText(
                          find.byKey(const Key('endDateField')), '2025-12-30');

                      // Step 4: Tap on Create Project button
                      await tester.ensureVisible(find.byKey(const Key('createProjectButton')));
                      await tester.tap(find.byKey(const Key('createProjectButton')));
                      await tester.pumpAndSettle();

                      // Step 5: Verify success message is shown
                      expect(find.text('Project created successfully!'), findsOneWidget);
                });
      });
}
