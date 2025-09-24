import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../l10n/generated/app_localizations.dart';

class SignInHeader extends StatelessWidget {
  const SignInHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Graduation Cap Icon
          Container(
            width: 80.w,
            height: 80.w,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Icon(Icons.school, size: 40.w, color: Colors.white),
          ),
          SizedBox(height: 24.h),

          // Title
          Text(
            AppLocalizations.of(context)!.welcomeBack,
            style: AppTextStyles.welcomeText,
          ),
          SizedBox(height: 8.h),

          // Subtitle
          Text(
            AppLocalizations.of(context)!.signInToWorkspace,
            style: AppTextStyles.welcomeSubtitle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
