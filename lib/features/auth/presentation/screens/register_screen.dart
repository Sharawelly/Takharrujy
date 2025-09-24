import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:takharrujy/core/theme/text_styles.dart';
import 'package:takharrujy/features/auth/view_model/cubit/auth_cubit.dart';

import '../../../../core/services/language_service.dart';
import '../widgets/register_header.dart';
import '../widgets/register_form.dart';
import '../widgets/language_selector.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isLoading = false;
  String _selectedLanguage = 'English';

  @override
  void initState() {
    super.initState();
    _loadCurrentLanguage();
  }

  Future<void> _loadCurrentLanguage() async {
    final language = await LanguageService.getLanguage();
    setState(() {
      _selectedLanguage = LanguageService.getLanguageFromLocale(
        LanguageService.getLocaleFromLanguage(language),
      );
    });
  }

  void _handleSubmit() {
    // TODO: Implement form submission logic
    context.read<AuthCubit>().register(
      name: '', // Will be handled by RegisterForm
      email: '', // Will be handled by RegisterForm
      password: '', // Will be handled by RegisterForm
      role: '', // Will be handled by RegisterForm
      university: '', // Will be handled by RegisterForm
    );
  }

  void _handleReset() {
    // Reset logic will be handled by RegisterForm
  }

  void _handleLanguageChange(String language) {
    setState(() {
      _selectedLanguage = language;
    });
    // Language switching is handled by LanguageService
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGrey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: AppColors.textPrimary),
          onPressed: () {},
        ),
        title: Text(
          'PMS',
          style: AppTextStyles.headlineMedium.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_outlined,
              color: AppColors.textPrimary,
            ),
            onPressed: () {},
          ),
          CircleAvatar(
            radius: 16,
            backgroundColor: AppColors.surfaceVariant,
            child: SvgPicture.asset(
              'assets/images/person.svg',
              width: 20.w,
              height: 20.h,
              colorFilter: const ColorFilter.mode(
                AppColors.textPrimary,
                BlendMode.srcIn,
              ),
            ),
          ),
          SizedBox(width: 16.w),
        ],
      ),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            setState(() => _isLoading = true);
          } else if (state is AuthSuccess) {
            setState(() => _isLoading = false);
            context.go('/dashboard');
          } else if (state is AuthError) {
            setState(() => _isLoading = false);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: Column(
            children: [
              // Register Header
              const RegisterHeader(),
              SizedBox(height: 32.h),

              // Register Form
              RegisterForm(
                onSubmit: _handleSubmit,
                onReset: _handleReset,
                isLoading: _isLoading,
              ),
              SizedBox(height: 32.h),

              // Language Selection
              LanguageSelector(
                selectedLanguage: _selectedLanguage,
                onLanguageChanged: _handleLanguageChange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
