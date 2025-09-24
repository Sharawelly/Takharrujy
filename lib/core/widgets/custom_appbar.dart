import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/colors.dart';
import '../theme/text_styles.dart';

enum AppBarType { standard, transparent, withBackButton, withMenu, minimal }

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final AppBarType type;
  final List<Widget>? actions;
  final Widget? leading;
  final VoidCallback? onLeadingPressed;
  final VoidCallback? onNotificationPressed;
  final VoidCallback? onProfilePressed;
  final VoidCallback? onSettingsPressed;
  final String? avatarImage;
  final bool showAvatar;
  final bool showNotifications;
  final bool centerTitle;
  final Color? backgroundColor;
  final double? elevation;
  final Widget? flexibleSpace;
  final PreferredSizeWidget? bottom;
  final double? toolbarHeight;
  final TextStyle? titleTextStyle;

  const CustomAppBar({
    super.key,
    this.title,
    this.type = AppBarType.standard,
    this.actions,
    this.leading,
    this.onLeadingPressed,
    this.onNotificationPressed,
    this.onProfilePressed,
    this.onSettingsPressed,
    this.avatarImage,
    this.showAvatar = true,
    this.showNotifications = true,
    this.centerTitle = true,
    this.backgroundColor,
    this.elevation,
    this.flexibleSpace,
    this.bottom,
    this.toolbarHeight,
    this.titleTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: _getBackgroundColor(),
      elevation: _getElevation(),
      centerTitle: centerTitle,
      leading: _buildLeading(),
      title: _buildTitle(),
      actions: _buildActions(),
      flexibleSpace: flexibleSpace,
      bottom: bottom,
      toolbarHeight: toolbarHeight ?? 56.h,
      titleTextStyle: titleTextStyle ?? _getTitleTextStyle(),
    );
  }

  Color _getBackgroundColor() {
    if (backgroundColor != null) return backgroundColor!;

    switch (type) {
      case AppBarType.transparent:
        return Colors.transparent;
      case AppBarType.minimal:
        return AppColors.surface;
      default:
        return AppColors.surface;
    }
  }

  double _getElevation() {
    if (elevation != null) return elevation!;
    return 0;
  }

  Widget? _buildLeading() {
    if (leading != null) return leading;

    switch (type) {
      case AppBarType.withBackButton:
        return IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: onLeadingPressed,
        );
      case AppBarType.minimal:
        return null;
      default:
        return null;
    }
  }

  Widget? _buildTitle() {
    if (title == null) return null;

    return Text(title!, style: titleTextStyle ?? _getTitleTextStyle());
  }

  TextStyle _getTitleTextStyle() {
    return AppTextStyles.appBarTitle;
  }

  List<Widget> _buildActions() {
    final List<Widget> actionWidgets = [];

    // Add custom actions
    if (actions != null) {
      actionWidgets.addAll(actions!);
    }

    // Add notification icon
    if (showNotifications) {
      actionWidgets.add(
        IconButton(
          icon: const Icon(
            Icons.notifications_outlined,
            color: AppColors.textPrimary,
          ),
          onPressed: onNotificationPressed,
        ),
      );
    }

    // Add avatar with dropdown
    if (showAvatar) {
      actionWidgets.add(
        PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'profile' && onProfilePressed != null) {
              onProfilePressed!();
            } else if (value == 'settings' && onSettingsPressed != null) {
              onSettingsPressed!();
            }
          },
          itemBuilder: (BuildContext context) => [
            const PopupMenuItem<String>(
              value: 'profile',
              child: Row(
                children: [
                  Icon(Icons.person, color: AppColors.textPrimary),
                  SizedBox(width: 8),
                  Text('Profile'),
                ],
              ),
            ),
            const PopupMenuItem<String>(
              value: 'settings',
              child: Row(
                children: [
                  Icon(Icons.settings, color: AppColors.textPrimary),
                  SizedBox(width: 8),
                  Text('Settings'),
                ],
              ),
            ),
          ],
          child: CircleAvatar(
            radius: 16.r,
            backgroundColor: AppColors.surfaceVariant,
            child: avatarImage != null
                ? Image.asset(avatarImage!, width: 30.w, height: 30.h)
                : Icon(Icons.person, color: AppColors.textPrimary, size: 20.w),
          ),
        ),
      );
      actionWidgets.add(SizedBox(width: 16.w));
    }

    return actionWidgets;
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight ?? 56.h);
}

// Predefined AppBar variants for common use cases
class StandardAppBar extends CustomAppBar {
  const StandardAppBar({
    super.key,
    super.title,
    super.actions,
    super.onNotificationPressed,
    super.onProfilePressed,
    super.onSettingsPressed,
    super.avatarImage,
    super.showAvatar,
    super.showNotifications,
  }) : super(type: AppBarType.standard);
}

class TransparentAppBar extends CustomAppBar {
  const TransparentAppBar({
    super.key,
    super.title,
    super.actions,
    super.onNotificationPressed,
    super.avatarImage,
    super.showAvatar,
    super.showNotifications,
  }) : super(type: AppBarType.transparent);
}

// class BackButtonAppBar extends CustomAppBar {
//   const BackButtonAppBar({
//     super.key,
//     super.title,
//     super.actions,
//     super.onLeadingPressed,
//     super.onNotificationPressed,
//     super.avatarImage,
//     super.showAvatar,
//     super.showNotifications,
//   }) : super(type: AppBarType.withBackButton, showMenu: false);
// }

// class MinimalAppBar extends CustomAppBar {
//   const MinimalAppBar({
//     super.key,
//     super.title,
//     super.actions,
//     super.onLeadingPressed,
//   }) : super(
//          type: AppBarType.minimal,
//          showMenu: false,
//          showNotifications: false,
//          showAvatar: false,
//        );
// }

// class MenuAppBar extends CustomAppBar {
//   const MenuAppBar({
//     super.key,
//     super.title,
//     super.actions,
//     super.onMenuPressed,
//     super.onNotificationPressed,
//     super.avatarImage,
//     super.showAvatar,
//     super.showNotifications,
//   }) : super(type: AppBarType.withMenu);
// }
