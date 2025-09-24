import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/widgets/custom_appbar.dart';
// import '../../../../core/widgets/navigation_drawer.dart';
import '../../../../core/widgets/bottom_navigation_bar.dart';
import '../../data/models/notification_item_model.dart';
import 'package:takharrujy/core/constants/constants.dart';
import '../widgets/notifications_body_widget.dart';
import '../../domain/services/notifications_service.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final NotificationsService _notificationsService = NotificationsService();

  // Filter states
  String selectedFilter = 'All Notifications';
  String selectedTimeRange = 'Last 7 days';

  List<NotificationItemModel> _notifications = [];
  List<NotificationItemModel> _filteredNotifications = [];

  @override
  void initState() {
    super.initState();
    _loadNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.backgroundGrey,
      appBar: StandardAppBar(
        title: 'Notifications',
        showAvatar: true,
        showNotifications: true,
        avatarImage: AppImages.sara,
        onNotificationPressed: () => context.push(AppRouter.notificationsRoute),
        onProfilePressed: () => context.push(AppRouter.profileRoute),
        onSettingsPressed: () => context.push(AppRouter.settingsRoute),
      ),
      // drawer: const CustomNavigationDrawer(currentRoute: '/notifications'),
      body: NotificationsBodyWidget(
        selectedFilter: selectedFilter,
        selectedTimeRange: selectedTimeRange,
        filteredNotifications: _filteredNotifications,
        notifications: _notifications,
        onFilterChanged: _onFilterChanged,
        onTimeRangeChanged: _onTimeRangeChanged,
        onFilterPressed: _showFilterOptions,
        onMarkAllRead: _markAllRead,
        onNotificationTap: _onNotificationTap,
        onLoadMore: _loadMore,
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(
        currentRoute: '/notifications',
      ),
    );
  }

  void _loadNotifications() {
    setState(() {
      _notifications = _notificationsService.getSampleNotifications();
      _filteredNotifications = _notifications;
    });
  }

  void _onFilterChanged(String? value) {
    if (value != null) {
      setState(() {
        selectedFilter = value;
        _applyFilters();
      });
    }
  }

  void _onTimeRangeChanged(String? value) {
    if (value != null) {
      setState(() {
        selectedTimeRange = value;
        _applyFilters();
      });
    }
  }

  void _applyFilters() {
    setState(() {
      _filteredNotifications = _notificationsService.filterByType(
        _notifications,
        selectedFilter,
      );
      _filteredNotifications = _notificationsService.filterByTimeRange(
        _filteredNotifications,
        selectedTimeRange,
      );
    });
  }

  void _onNotificationTap(NotificationItemModel notification) {
    _notificationsService.showInfoMessage(
      context,
      '${NotificationsConstants.notificationSelectedMessage}: ${notification.title}',
    );
  }

  void _showFilterOptions() {
    _notificationsService.showInfoMessage(
      context,
      NotificationsConstants.filterOptionsMessage,
    );
  }

  void _markAllRead() {
    setState(() {
      _notifications = _notificationsService.markAllAsRead(_notifications);
      _filteredNotifications = _notifications;
    });
    _notificationsService.showSuccessMessage(
      context,
      NotificationsConstants.markAllReadMessage,
    );
  }

  void _loadMore() {
    _notificationsService.showInfoMessage(
      context,
      NotificationsConstants.loadMoreMessage,
    );
  }
}
