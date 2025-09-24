import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/colors.dart';
import '../../data/models/message_model.dart';
import 'chat_message_bubble.dart';

class ChatMessagesList extends StatelessWidget {
  final List<MessageModel> messages;
  final ScrollController scrollController;

  const ChatMessagesList({
    super.key,
    required this.messages,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColors.backgroundGrey,
      child: messages.isEmpty
          ? Center(
              child: Text(
                'No messages yet',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 16.sp,
                ),
              ),
            )
          : ListView.builder(
              controller: scrollController,
              padding: EdgeInsets.all(16.w),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isLastMessage = index == messages.length - 1;
                final isFirstMessage = index == 0;

                // Check if we should show timestamp
                bool showTimestamp = isLastMessage;
                if (!isFirstMessage) {
                  final previousMessage = messages[index - 1];
                  final timeDifference = message.timestamp.difference(
                    previousMessage.timestamp,
                  );
                  showTimestamp = timeDifference.inMinutes > 5;
                }

                return Column(
                  children: [
                    if (showTimestamp) ...[
                      SizedBox(height: 8.h),
                      _buildTimestamp(message.timestamp),
                      SizedBox(height: 8.h),
                    ],
                    ChatMessageBubble(
                      message: message,
                      showAvatar:
                          isLastMessage ||
                          (index < messages.length - 1 &&
                              messages[index + 1].senderId != message.senderId),
                    ),
                    SizedBox(height: 8.h),
                  ],
                );
              },
            ),
    );
  }

  Widget _buildTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final messageDate = DateTime(
      timestamp.year,
      timestamp.month,
      timestamp.day,
    );

    String timeText;
    if (messageDate == today) {
      timeText = 'Today, ${_formatTime(timestamp)}';
    } else if (messageDate == today.subtract(const Duration(days: 1))) {
      timeText = 'Yesterday, ${_formatTime(timestamp)}';
    } else {
      timeText = '${_formatDate(timestamp)}, ${_formatTime(timestamp)}';
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(
        timeText,
        style: TextStyle(
          color: AppColors.textSecondary,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  String _formatTime(DateTime dateTime) {
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final period = dateTime.hour < 12 ? 'AM' : 'PM';
    final displayHour = dateTime.hour > 12 ? dateTime.hour - 12 : dateTime.hour;
    return '${displayHour == 0 ? 12 : displayHour}:$minute $period';
  }

  String _formatDate(DateTime dateTime) {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[dateTime.month - 1]} ${dateTime.day}';
  }
}
