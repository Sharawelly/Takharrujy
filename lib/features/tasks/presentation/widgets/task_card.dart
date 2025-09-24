import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/router/app_router.dart';
import '../../data/models/task_model.dart';
import 'task_tags_widget.dart';
import 'task_details_widget.dart';
import 'task_action_buttons.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;
  final VoidCallback? onTap;
  final VoidCallback? onDetailsTap;
  final VoidCallback? onActionTap;

  const TaskCard({
    super.key,
    required this.task,
    this.onTap,
    this.onDetailsTap,
    this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 358.w,
        margin: EdgeInsets.only(bottom: 16.h),
        decoration: BoxDecoration(
          color: AppColors.surface,
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowLight,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(17.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with title and menu
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    task.title,
                    style: AppTextStyles.titleMedium.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => context.push(AppRouter.aiAssistantRoute),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          AppImages.ai,
                          width: 15.w,
                          height: 15.h,
                          colorFilter: const ColorFilter.mode(
                            AppColors.grey500,
                            BlendMode.srcIn,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Ask AI',
                          style: AppTextStyles.bodySmall.copyWith(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.grey500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),

              // Tags
              TaskTagsWidget(task: task),
              SizedBox(height: 12.h),

              // Description
              Text(
                task.description,
                style: AppTextStyles.bodyMedium.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                  height: 1.2,
                ),
              ),
              SizedBox(height: 16.h),

              // Details
              TaskDetailsWidget(task: task),
              SizedBox(height: 16.h),

              // Action Buttons
              TaskActionButtons(
                task: task,
                onActionTap: onActionTap,
                onDetailsTap: onDetailsTap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
