import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../theme/text_styles.dart';
import '../theme/colors.dart';
import '../utils/app_images.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final String currentRoute;

  const CustomBottomNavigationBar({super.key, required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: const Border(top: BorderSide(color: AppColors.border)),
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(8.w, 9.h, 8.w, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(
              context: context,
              iconPath: AppImages.projectProgress,
              label: 'home',
              route: '/dashboard',
              isSelected: currentRoute == '/dashboard',
            ),
            _buildNavItem(
              context: context,
              iconPath: AppImages.createNewTask,
              label: 'Create',
              route: '/create-project',
              isSelected: currentRoute == '/create-project',
            ),
            _buildNavItem(
              context: context,
              iconPath: AppImages.taskList,
              label: 'Tasks',
              route: '/tasks',
              isSelected: currentRoute == '/tasks',
            ),
            _buildNavItem(
              context: context,
              iconPath: AppImages.newMessage,
              label: 'message',
              route: '/messages',
              isSelected: currentRoute == '/messages',
            ),
            _buildNavItem(
              context: context,
              iconPath: AppImages.teamMember,
              label: 'Community',
              route: '/community',
              isSelected: currentRoute == '/community',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required String iconPath,
    required String label,
    required String route,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () => context.go(route),
      child: SizedBox(
        width: 60.w,
        height: 64.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 20.w,
              height: 20.h,
              child: SvgPicture.asset(
                iconPath,
                width: 20.w,
                height: 18.h,
                colorFilter: ColorFilter.mode(
                  isSelected ? AppColors.primary : AppColors.textTertiary,
                  BlendMode.srcIn,
                ),
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              label,
              style: AppTextStyles.bodySmall.copyWith(
                fontSize: 10.sp,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                color: isSelected ? AppColors.primary : AppColors.textTertiary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
