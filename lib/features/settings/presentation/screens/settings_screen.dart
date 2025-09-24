import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:takharrujy/core/utils/app_images.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/custom_appbar.dart';

import '../widgets/language_settings_card.dart';
import '../widgets/notifications_card.dart';
import '../widgets/privacy_settings_card.dart';
import '../widgets/display_settings_card.dart';
import '../widgets/save_settings_button.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Language settings
  String selectedInterfaceLanguage = 'English';
  String selectedContentLanguage = 'English';

  // Notification settings
  bool emailNotifications = true;
  bool pushNotifications = true;
  bool taskDeadlines = true;
  bool newMessages = true;
  bool supervisorFeedback = true;

  // Privacy settings
  bool profileVisibility = true;
  bool onlineStatus = false;

  // Display settings
  String selectedTheme = 'Light Mode';
  String selectedDateFormat = 'DD/MM/YYYY';
  String selectedTimeFormat = '12 Hour (AM/PM)';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.backgroundGrey,
      appBar: StandardAppBar(
        title: 'Settings',
        showAvatar: true,
        showNotifications: true,
        onNotificationPressed: () => context.push('/notifications'),
        onProfilePressed: () => context.push('/profile'),
        onSettingsPressed: () => context.push('/settings'),
        avatarImage: AppImages.sara,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 16.h),

            // Language Settings Card
            LanguageSettingsCard(
              selectedInterfaceLanguage: selectedInterfaceLanguage,
              selectedContentLanguage: selectedContentLanguage,
              onInterfaceLanguageChanged: (value) {
                setState(() {
                  selectedInterfaceLanguage = value!;
                });
              },
              onContentLanguageChanged: (value) {
                setState(() {
                  selectedContentLanguage = value!;
                });
              },
            ),
            SizedBox(height: 16.h),

            // Notifications Card
            NotificationsCard(
              emailNotifications: emailNotifications,
              pushNotifications: pushNotifications,
              taskDeadlines: taskDeadlines,
              newMessages: newMessages,
              supervisorFeedback: supervisorFeedback,
              onEmailNotificationsChanged: (value) {
                setState(() {
                  emailNotifications = value;
                });
              },
              onPushNotificationsChanged: (value) {
                setState(() {
                  pushNotifications = value;
                });
              },
              onTaskDeadlinesChanged: (value) {
                setState(() {
                  taskDeadlines = value;
                });
              },
              onNewMessagesChanged: (value) {
                setState(() {
                  newMessages = value;
                });
              },
              onSupervisorFeedbackChanged: (value) {
                setState(() {
                  supervisorFeedback = value;
                });
              },
            ),
            SizedBox(height: 16.h),

            // Privacy Settings Card
            PrivacySettingsCard(
              profileVisibility: profileVisibility,
              onlineStatus: onlineStatus,
              onProfileVisibilityChanged: (value) {
                setState(() {
                  profileVisibility = value;
                });
              },
              onOnlineStatusChanged: (value) {
                setState(() {
                  onlineStatus = value;
                });
              },
            ),
            SizedBox(height: 16.h),

            // Display Settings Card
            DisplaySettingsCard(
              selectedTheme: selectedTheme,
              selectedDateFormat: selectedDateFormat,
              selectedTimeFormat: selectedTimeFormat,
              onThemeChanged: (value) {
                setState(() {
                  selectedTheme = value!;
                });
              },
              onDateFormatChanged: (value) {
                setState(() {
                  selectedDateFormat = value!;
                });
              },
              onTimeFormatChanged: (value) {
                setState(() {
                  selectedTimeFormat = value!;
                });
              },
            ),
            SizedBox(height: 16.h),

            // Save Settings Button
            SaveSettingsButton(onSave: _saveSettings),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }

  void _saveSettings() {
    // TODO: Implement save settings functionality
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Settings saved successfully!'),
        backgroundColor: AppColors.success,
      ),
    );
  }
}
