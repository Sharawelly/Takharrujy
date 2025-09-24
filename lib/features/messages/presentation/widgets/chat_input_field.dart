import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';

class ChatInputField extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const ChatInputField({
    super.key,
    required this.controller,
    required this.onSend,
  });

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _isTyping = widget.controller.text.trim().isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 75.h,
      decoration: BoxDecoration(color: AppColors.surface),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 17.h),
        child: Row(
          children: [
            // Attachment Button
            Container(
              width: 30.w,
              height: 40.h,
              decoration: BoxDecoration(color: Colors.transparent),
              child: IconButton(
                onPressed: () {
                  // TODO: Implement attachment functionality
                },
                icon: Icon(
                  Icons.attach_file,
                  color: AppColors.textSecondary,
                  size: 20.w,
                ),
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(minWidth: 30.w, minHeight: 40.h),
              ),
            ),
            SizedBox(width: 12.w),

            // Text Input Field
            Expanded(
              child: TextField(
                controller: widget.controller,
                decoration: InputDecoration(
                  hintText: 'Type your message...',
                  hintStyle: AppTextStyles.bodyMedium.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textHint,
                    height: 1.5,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 9.h,
                  ),
                ),
                style: AppTextStyles.bodyMedium.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textPrimary,
                  height: 1.5,
                ),
                maxLines: null,
                textInputAction: TextInputAction.send,
                onSubmitted: (_) => widget.onSend(),
              ),
            ),
            SizedBox(width: 12.w),

            // Send Button
            Container(
              width: 48.w,
              height: 40.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primary, AppColors.primaryDark],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: IconButton(
                onPressed: _isTyping ? widget.onSend : null,
                icon: Icon(Icons.send, color: AppColors.white, size: 16.w),
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(minWidth: 48.w, minHeight: 40.h),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
