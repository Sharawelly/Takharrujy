import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/text_styles.dart';
import 'personal_info_tab.dart';
import 'security_tab.dart';
import 'preferences_tab.dart';

class TabbedContent extends StatefulWidget {
  const TabbedContent({super.key});

  @override
  State<TabbedContent> createState() => _TabbedContentState();
}

class _TabbedContentState extends State<TabbedContent>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358.w,
      height: 754.h,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          // Tab Bar
          Container(
            height: 43.h,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: const Color(0xFFE2E8F0), width: 1.w),
              ),
            ),
            child: TabBar(
              controller: _tabController,
              indicatorColor: const Color(0xFF0EA5E9),
              indicatorWeight: 2.w,
              labelColor: AppColors.primary,
              unselectedLabelColor: const Color(0xFF64748B),
              labelStyle: AppTextStyles.bodySmall.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
              tabs: const [
                Tab(text: 'Personal Info'),
                Tab(text: 'Security'),
                Tab(text: 'Preferences'),
              ],
            ),
          ),

          // Tab Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                PersonalInfoTab(),
                SecurityTab(),
                PreferencesTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
