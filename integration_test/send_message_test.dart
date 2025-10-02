import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:takharrujy/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Send Message Flow', () {
    testWidgets('User opens app, navigates to messages and sends a message',
            (WidgetTester tester) async {
          app.main();
          await tester.pumpAndSettle();

          await tester.tap(find.text('message'));
          await tester.pumpAndSettle();

          await tester.tap(find.byKey(const Key('conversationItem_1')));
          await tester.pumpAndSettle();

          await tester.enterText(
            find.byKey(const Key('messageInputField')),
            'Hello, this is a test message',
          );
          await tester.pumpAndSettle();

          await tester.tap(find.byKey(const Key('sendMessageButton')));
          await tester.pumpAndSettle();

          expect(find.text('Hello, this is a test message'), findsOneWidget);
        });
  });
}
