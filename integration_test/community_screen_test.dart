// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:integration_test/integration_test.dart';
// import 'package:takharrujy/main.dart' as app;
//
// void main() {
//   IntegrationTestWidgetsFlutterBinding.ensureInitialized();
//
//   group('Community Screen Flow', () {
//     testWidgets('User filters, sorts, joins, and views project',
//             (WidgetTester tester) async {
//           app.main();
//           await tester.pumpAndSettle();
//
//           await tester.tap(find.text('Community'));
//           await tester.pumpAndSettle();
//
//           expect(find.text('Community Projects'), findsOneWidget);
//
//           final facultyDropdown = find.byKey(const Key('facultyDropdown'));
//           await tester.ensureVisible(facultyDropdown);
//           await tester.tap(facultyDropdown);
//           await tester.pumpAndSettle();
//           await tester.tap(find.text('Engineering').last);
//           await tester.pumpAndSettle();
//
//           final searchButton = find.byKey(const Key('searchButton'));
//           await tester.tap(searchButton);
//           await tester.pumpAndSettle();
//
//           expect(find.textContaining('Searching with:'), findsOneWidget);
//
//           final sortButton = find.byKey(const Key('sortButton'));
//           await tester.tap(sortButton);
//           await tester.pumpAndSettle();
//
//           await tester.tap(find.text('Newest').last);
//           await tester.pumpAndSettle();
//
//           final joinButton = find.byKey(const Key('joinButton_0')); // project index 0
//           await tester.tap(joinButton);
//           await tester.pumpAndSettle();
//
//           expect(find.textContaining('Join request for'), findsOneWidget);
//
//           final viewButton = find.byKey(const Key('viewButton_0'));
//           await tester.tap(viewButton);
//           await tester.pumpAndSettle();
//
//           expect(find.textContaining('Viewing details for'), findsOneWidget);
//         });
//   });
// }
