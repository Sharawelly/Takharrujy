import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  // Common
  String get createAccount => 'Create Account';
  String get joinPlatform => 'Join our project management platform';
  String get fullName => 'Full Name';
  String get enterFullName => 'Enter your full name';
  String get emailAddress => 'Email Address';
  String get enterEmail => 'Enter your email';
  String get role => 'Role';
  String get selectRole => 'Select your role';
  String get university => 'University';
  String get selectUniversity => 'Select your university';
  String get password => 'Password';
  String get createPassword => 'Create a password';
  String get confirmPassword => 'Confirm Password';
  String get confirmPasswordHint => 'Confirm your password';
  String get passwordHint => 'Password must be at least 8 characters';
  String get agreeToTerms => 'I agree to the ';
  String get termsOfService => 'Terms of Service';
  String get and => 'and';
  String get privacyPolicy => 'Privacy Policy';
  String get resetForm => 'Reset Form';
  String get alreadyHaveAccount => 'Already have an account? ';
  String get signInHere => 'Sign in here';

  // Validation Messages
  String get roleRequired => 'Please select a role';
  String get universityRequired => 'Please select a university';
  String get agreeToTermsRequired =>
      'You must agree to the terms and conditions';

  // Login
  String get login => 'Login';
  String get enterPassword => 'Enter your password';
  String get forgotPassword => 'Forgot Password?';
  String get dontHaveAccount => "Don't have an account? ";
  String get signUpHere => 'Sign up here';

  // Home
  String get home => 'Home';
  String get projects => 'Projects';
  String get tasks => 'Tasks';
  String get messages => 'Messages';
  String get profile => 'Profile';

  // Projects
  String get createProject => 'Create Project';
  String get projectTitle => 'Project Title';
  String get projectDescription => 'Project Description';
  String get teamMembers => 'Team Members';
  String get supervisorPreference => 'Supervisor Preference';
  String get submit => 'Submit';
  String get reset => 'Reset';

  // Tasks
  String get createTask => 'Create Task';
  String get taskTitle => 'Task Title';
  String get taskDescription => 'Task Description';
  String get deadline => 'Deadline';
  String get assignedMember => 'Assigned Member';
  String get status => 'Status';
  String get priority => 'Priority';
  String get low => 'Low';
  String get medium => 'Medium';
  String get high => 'High';

  // Deliverables
  String get uploadDeliverable => 'Upload Deliverable';
  String get deliverableType => 'Deliverable Type';
  String get proposal => 'Proposal';
  String get report => 'Report';
  String get code => 'Code';
  String get presentation => 'Presentation';
  String get other => 'Other';
  String get uploadFile => 'Upload File';
  String get description => 'Description';

  // AI Assistant
  String get aiAssistant => 'AI Assistant';
  String get askQuestion => 'Ask a question';
  String get taskType => 'Task Type';
  String get qa => 'Q&A';
  String get reportHelp => 'Report Help';
  String get planning => 'Planning';
  String get productivity => 'Productivity';

  // Feedback
  String get feedback => 'Feedback';
  String get addFeedback => 'Add Feedback';
  String get comment => 'Comment';
  String get rating => 'Rating';
  String get excellent => 'Excellent';
  String get good => 'Good';
  String get average => 'Average';
  String get poor => 'Poor';

  // Messages
  String get sendMessage => 'Send Message';
  String get typeMessage => 'Type a message...';
  String get messageSubject => 'Message Subject';

  // Profile
  String get editProfile => 'Edit Profile';
  String get changePassword => 'Change Password';
  String get oldPassword => 'Old Password';
  String get newPassword => 'New Password';
  String get save => 'Save';
  String get cancel => 'Cancel';

  // Notifications
  String get notifications => 'Notifications';
  String get noNotifications => 'No notifications';

  // Common Actions
  String get edit => 'Edit';
  String get delete => 'Delete';
  String get view => 'View';
  String get download => 'Download';
  String get upload => 'Upload';
  String get search => 'Search';
  String get filter => 'Filter';
  String get sort => 'Sort';
  String get refresh => 'Refresh';

  // Status
  String get pending => 'Pending';
  String get inProgress => 'In Progress';
  String get completed => 'Completed';
  String get cancelled => 'Cancelled';
  String get approved => 'Approved';
  String get rejected => 'Rejected';

  // Error Messages
  String get errorOccurred => 'An error occurred';
  String get tryAgain => 'Try Again';
  String get networkError => 'Network error. Please check your connection.';
  String get serverError => 'Server error. Please try again later.';
  String get validationError => 'Please check your input and try again.';

  // Success Messages
  String get success => 'Success';
  String get savedSuccessfully => 'Saved successfully';
  String get uploadedSuccessfully => 'Uploaded successfully';
  String get deletedSuccessfully => 'Deleted successfully';
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}








