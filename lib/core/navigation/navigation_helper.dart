// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// /// Helper class for common navigation operations
// class NavigationHelper {
//   // Auth Navigation
//   static void goToSignIn(BuildContext context) {
//     context.go('/signin');
//   }

//   static void goToRegister(BuildContext context) {
//     context.go('/register');
//   }

//   // Main App Navigation
//   static void goToHome(BuildContext context) {
//     context.go('/home');
//   }

//   static void goToDashboard(BuildContext context) {
//     context.go('/dashboard');
//   }

//   static void pushToDashboard(BuildContext context) {
//     context.push('/dashboard');
//   }

//   // Generic Navigation
//   static void goTo(BuildContext context, String route) {
//     context.go(route);
//   }

//   static void pushTo(BuildContext context, String route) {
//     context.push(route);
//   }

//   static void pop(BuildContext context) {
//     context.pop();
//   }

//   static void popUntil(BuildContext context, String route) {
//     context.go(route);
//   }

//   // Navigation with data
//   static void goToWithData(
//     BuildContext context,
//     String route,
//     Map<String, dynamic> data,
//   ) {
//     context.go(route, extra: data);
//   }

//   static void pushToWithData(
//     BuildContext context,
//     String route,
//     Map<String, dynamic> data,
//   ) {
//     context.push(route, extra: data);
//   }
// }
