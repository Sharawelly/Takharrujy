import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/utils/app_images.dart';
import '../../data/models/conversation_item_model.dart';

class ChatHeader extends StatelessWidget implements PreferredSizeWidget {
  final ConversationItemModel conversation;

  const ChatHeader({super.key, required this.conversation});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.surface,
      elevation: 0,
      centerTitle: false,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: _buildTitle(),
      toolbarHeight: 70.h,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1.h),
        child: Container(height: 1.h, color: AppColors.border),
      ),
    );
  }

  Widget _buildTitle() {
    return Row(
      children: [
        // Avatar
        Container(
          width: 48.w,
          height: 48.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.border, width: 2),
          ),
          child: ClipOval(
            child: Image.asset(
              AppImages.sara,
              width: 48.w,
              height: 48.h,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 12.w),

        // Name and Role
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              conversation.name,
              style: AppTextStyles.bodyMedium.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
                height: 1.43,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              conversation.role,
              style: AppTextStyles.bodySmall.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textSecondary,
                height: 1.33,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70.h);
}
