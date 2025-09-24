import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:takharrujy/features/auth/data/repositories/auth_repository_imp.dart';
import 'core/theme/app_theme.dart';
import 'core/router/app_router.dart';
import 'l10n/generated/app_localizations.dart';
import 'features/auth/view_model/cubit/auth_cubit.dart';

void main() {
  runApp(const TakharrujyApp());
}

class TakharrujyApp extends StatelessWidget {
  const TakharrujyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // designSize: const Size(375, 812), // iPhone X design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<AuthCubit>(
              create: (context) => AuthCubit(
                authRepository: AuthRepositoryImpl(), // TODO: Implement this
              ),
            ),
          ],
          child: MaterialApp.router(
            title: 'Takharrujy',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [Locale('en', ''), Locale('ar', '')],
            locale: const Locale('en', ''),
            routerConfig: AppRouter.router,
          ),
        );
      },
    );
  }
}
