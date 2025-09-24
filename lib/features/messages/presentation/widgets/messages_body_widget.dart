import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/colors.dart';
import '../../data/models/conversation_item_model.dart';
import 'package:takharrujy/core/constants/constants.dart';
import 'messages_search_section.dart';
import 'messages_conversations_list.dart';

class MessagesBodyWidget extends StatelessWidget {
  final TextEditingController searchController;
  final List<ConversationItemModel> filteredConversations;
  final Function(String) onSearchChanged;
  final Function(ConversationItemModel) onConversationTap;

  const MessagesBodyWidget({
    super.key,
    required this.searchController,
    required this.filteredConversations,
    required this.onSearchChanged,
    required this.onConversationTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MessagesConstants.screenWidth.w,
      height: MessagesConstants.screenHeight.h,
      decoration: BoxDecoration(
        color: AppColors.backgroundGrey,
        border: Border(
          left: BorderSide(color: AppColors.border, width: 2),
          right: BorderSide(color: AppColors.border, width: 2),
          bottom: BorderSide(color: AppColors.border, width: 2),
        ),
      ),
      child: Container(
        width: MessagesConstants.containerWidth.w,
        height: MessagesConstants.screenHeight.h,
        margin: EdgeInsets.only(left: 3.w),
        decoration: BoxDecoration(
          color: AppColors.surface,
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowDark,
              blurRadius: 10,
              offset: const Offset(0, 8),
            ),
            BoxShadow(
              color: AppColors.shadowLight,
              blurRadius: 25,
              offset: const Offset(0, 20),
            ),
          ],
        ),
        child: Column(
          children: [
            MessagesSearchSection(
              searchController: searchController,
              onSearchChanged: onSearchChanged,
            ),
            MessagesConversationsList(
              conversations: filteredConversations,
              onConversationTap: onConversationTap,
            ),
          ],
        ),
      ),
    );
  }
}
