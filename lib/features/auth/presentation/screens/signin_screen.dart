import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:takharrujy/features/auth/view_model/cubit/auth_cubit.dart';

import '../../../../core/services/language_service.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/utils/app_images.dart';
import '../widgets/signin_header.dart';
import '../widgets/signin_form.dart';
import '../widgets/language_selector.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
    // TODO: Implement sign in logic
    context.read<AuthCubit>().login(
      email: '', // Will be handled by SignInForm
      password: '', // Will be handled by SignInForm
    );
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
      appBar: const TransparentAppBar(
        title: 'PMS',
        // Add your menu action here
        onNotificationPressed: null, // Add your notification action here
        avatarImage: AppImages.person,
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
              // Sign In Header
              const SignInHeader(),
              SizedBox(height: 32.h),

              // Sign In Form
              SignInForm(onSubmit: _handleSubmit, isLoading: _isLoading),
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
