import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:takharrujy/main.dart' as app;

void main() {
      IntegrationTestWidgetsFlutterBinding.ensureInitialized();

      group('Community Screen Flow', () {
            testWidgets('User navigates to community, filters, sorts and joins a project',
                    (WidgetTester tester) async {
                      // Step 1: Run the app
                      app.main();
                      await tester.pumpAndSettle();();

                      await tester.tap(find.text('Community')); // bottom nav item
                      await tester.pumpAndSettle();

                      // Step 3: Verify community projects list is visible
                      expect(find.text('Community Projects'), findsOneWidget);

                      // Step 4: Change faculty filter (dropdown)
                      await tester.tap(find.byKey(const Key('facultyDropdown')));
                      await tester.pumpAndSettle();
                      await tester.tap(find.text('Engineering').last);
                      await tester.pumpAndSettle();

                      // Step 5: Tap search button
                      await tester.tap(find.byKey(const Key('searchProjectsButton')));
                      await tester.pumpAndSettle();

                      // Verify that Snackbar or dialog is shown
                      expect(find.textContaining('Searching'), findsOneWidget);
            });
      });
}
