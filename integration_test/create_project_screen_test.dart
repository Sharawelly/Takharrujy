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
          await tester.enterText(find.text('title'), 'My Graduation Project');
          await tester.enterText(find.byKey(const Key('descriptionField')), 'This is a test project');

          // اختر Supervisor
          await tester.tap(find.byKey(const Key('supervisorDropdown')));
          await tester.pumpAndSettle();
          await tester.tap(find.text('Dr. Smith').last);
          await tester.pumpAndSettle();

          // اختر Category
          await tester.tap(find.byKey(const Key('categoryDropdown')));
          await tester.pumpAndSettle();
          await tester.tap(find.text('Software Engineering').last);
          await tester.pumpAndSettle();

          // حدد التواريخ (ممكن تعمل Mock DatePicker أو تعطيها مباشرة)
          // هنا بنكتب نص في الـTextField لو معمول بـcontroller
          await tester.enterText(find.byKey(const Key('startDateField')), '2025-10-01');
          await tester.enterText(find.byKey(const Key('endDateField')), '2025-12-30');

          // Step 4: اضغط Create Project
          await tester.tap(find.byKey(const Key('createProjectButton')));
          await tester.pumpAndSettle();

          // Step 5: تأكد إن رسالة النجاح ظهرت
          expect(find.text('Project created successfully!'), findsOneWidget);
        });
  });
}
