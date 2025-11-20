import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/di/di.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/core/utils/app_theme.dart';
import 'package:movie_app/core/utils/bloc_observer.dart';
import 'package:movie_app/core/utils/shared_prefrence.dart';
import 'package:movie_app/feature/auth/ui/views/forget_password_view.dart';
import 'package:movie_app/feature/auth/ui/views/log_in_views.dart';
import 'package:movie_app/feature/auth/ui/views/register_view.dart';
import 'package:movie_app/feature/home/ui/views/home_views.dart';
import 'package:movie_app/feature/onboarding/ui/on_boarding_views.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  await SharedPreference.init();
  final bool? hasSeenOnBoarding = SharedPreference.getData(
    AppStrings.isFirstOpen,
  );
  final String? getTokenSaved = SharedPreference.getData(
    AppStrings.tokenOfLoggedInOrCreatedAccount,
  );

  runApp(
    MyApp(hasSeenOnBoarding: hasSeenOnBoarding, getTokenSaved: getTokenSaved),
  );
}

class MyApp extends StatelessWidget {
  final bool? hasSeenOnBoarding;
  final String? getTokenSaved;
  const MyApp({
    super.key,
    required this.hasSeenOnBoarding,
    required this.getTokenSaved,
  });

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
          initialRoute: hasSeenOnBoarding == null
              ? AppRoutes.onBoarding
              : getTokenSaved == null
              ? AppRoutes.logIn
              : AppRoutes.homeViews,
          routes: {
            AppRoutes.onBoarding: (context) => OnBoardingViews(),
            AppRoutes.logIn: (context) => LogInViews(),
            AppRoutes.register: (context) => RegisterView(),
            AppRoutes.forgetPassword: (context) => ForgetPasswordView(),
            AppRoutes.homeViews: (context) => HomeViews(),
          },
        );
      },
    );
  }
}
