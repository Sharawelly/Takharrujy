import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/bottom_navigation_bar.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/utils/app_images.dart';
import '../../data/models/conversation_item_model.dart';
import '../widgets/messages_body_widget.dart';
import '../../domain/services/messages_service.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final TextEditingController _searchController = TextEditingController();
  final MessagesService _messagesService = MessagesService();

  List<ConversationItemModel> _conversations = [];
  List<ConversationItemModel> _filteredConversations = [];

  @override
  void initState() {
    super.initState();
    _loadConversations();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGrey,
      appBar: StandardAppBar(
        title: 'Messages',
        showAvatar: true,
        showNotifications: true,
        onNotificationPressed: () => context.push(AppRouter.notificationsRoute),
        onProfilePressed: () => context.push(AppRouter.profileRoute),
        onSettingsPressed: () => context.push(AppRouter.settingsRoute),
        avatarImage: AppImages.sara,
      ),
      body: MessagesBodyWidget(
        searchController: _searchController,
        filteredConversations: _filteredConversations,
        onSearchChanged: _onSearchChanged,
        onConversationTap: _onConversationTap,
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(
        currentRoute: '/messages',
      ),
    );
  }

  void _loadConversations() {
    setState(() {
      _conversations = _messagesService.getSampleConversations();
      _filteredConversations = _conversations;
    });
  }

  void _onSearchChanged(String query) {
    setState(() {
      _filteredConversations = _messagesService.searchConversations(
        _conversations,
        query,
      );
    });
  }

  void _onConversationTap(ConversationItemModel conversation) {
    _messagesService.navigateToChat(context, conversation);
  }
}
