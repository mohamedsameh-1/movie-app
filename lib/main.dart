import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/core/utils/app_theme.dart';
import 'package:movie_app/core/utils/shared_prefrence.dart';
import 'package:movie_app/feature/auth/ui/views/log_in_views.dart';
import 'package:movie_app/feature/onboarding/ui/on_boarding_views.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreference.init();
  final bool isFirstLoggedIn =
      SharedPreference.getData(AppStrings.firstLoggedIn) ?? false;
  runApp(MyApp(isFirstLoggedIn: isFirstLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isFirstLoggedIn;
  const MyApp({super.key, required this.isFirstLoggedIn});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.darkTheme,
          initialRoute: isFirstLoggedIn
              ? AppRoutes.logIn
              : AppRoutes.onBoarding,
          routes: {
            AppRoutes.onBoarding: (context) => OnBoardingViews(),
            AppRoutes.logIn: (context) => LogInViews(),
          },
        );
      },
    );
  }
}
