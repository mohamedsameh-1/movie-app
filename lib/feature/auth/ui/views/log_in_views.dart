import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/di/di.dart';
import 'package:movie_app/core/utils/app_assets.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/core/utils/app_validator.dart';
import 'package:movie_app/core/utils/shared_prefrence.dart';
import 'package:movie_app/core/widgets/animated_toogle_switch_widget.dart';
import 'package:movie_app/core/widgets/custom_elevate_btn.dart';
import 'package:movie_app/core/widgets/custom_message_dialog.dart';
import 'package:movie_app/core/widgets/custom_text_field.dart';
import 'package:movie_app/feature/auth/ui/viewmodel/login/log_in_cubit.dart';
import 'package:movie_app/feature/auth/ui/viewmodel/login/log_in_state.dart';

class LogInViews extends StatelessWidget {
  const LogInViews({super.key});

  @override
  Widget build(BuildContext context) {
    LogInCubit logInCubit = getIt<LogInCubit>();
    return BlocProvider(
      create: (context) => logInCubit,
      child: BlocListener<LogInCubit, LogInState>(
        listener: (context, state) {
          if (state is LogInLoadingState) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const CustomMessageDialog(
                message: 'Loading...',
                type: MessageType.loading,
              ),
            );
          } else if (state is LogInFailureState) {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (_) => CustomMessageDialog(
                message: state.failure.failureMessage,
                type: MessageType.error,
              ),
            );
          } else if (state is LogInSuccessState) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.loginEntity.message),
                backgroundColor: AppColors.green,
              ),
            );
            SharedPreference.saveData(
              key: AppStrings.tokenOfLoggedInOrCreatedAccount,
              value: state.loginEntity.token,
            );
            Navigator.pushReplacementNamed(context, AppRoutes.homeViews);
          }
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 19.w),
              child: Form(
                key: logInCubit.formKey,
                child: Column(
                  children: [
                    SizedBox(height: 67.h),
                    //image
                    Image.asset(
                      AppAssets.mainImage,
                      height: 118.h,
                      width: 121.w,
                    ),
                    SizedBox(height: 69.h),
                    //email
                    CustomTextField(
                      controller: logInCubit.emailController,
                      validator: AppValidator.validateEmail,
                      hintText: AppStrings.login,
                      prefixIcon: Icon(Icons.email),
                    ),
                    SizedBox(height: 22.h),
                    //password
                    BlocBuilder<LogInCubit, LogInState>(
                      builder: (context, state) {
                        return CustomTextField(
                          controller: logInCubit.passwordController,
                          validator: AppValidator.validatePassword,
                          hintText: AppStrings.password,
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            onPressed: () {
                              logInCubit.changePassVisibility();
                            },
                            icon: Icon(
                              logInCubit.isPassVisibilityOff
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: AppColors.white,
                            ),
                          ),
                          obscureText: logInCubit.isPassVisibilityOff,
                        );
                      },
                    ),
                    SizedBox(height: 15.h),
                    //forget pass
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.forgetPassword);
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          AppStrings.forgetPassword,
                          style: AppStyles.w400S14Yellow,
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    //logIn btn
                    CustomElevateBtn(
                      text: AppStrings.login,
                      onPressed: () {
                        logInCubit.login();
                      },
                    ),
                    SizedBox(height: 20.h),
                    //if don't have account
                    Text.rich(
                      TextSpan(
                        text: AppStrings.dontHaveAccount,
                        style: AppStyles.w400S14White,
                        children: [
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  AppRoutes.register,
                                );
                              },
                              child: Text(
                                AppStrings.createOne,
                                style: AppStyles.w400S14Yellow,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25.h),
                    //or divider
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: AppColors.yellow,
                            indent: 60.w,
                            endIndent: 10.w,
                          ),
                        ),
                        Text(AppStrings.oR, style: AppStyles.w400S14Yellow),
                        Expanded(
                          child: Divider(
                            color: AppColors.yellow,
                            indent: 10.w,
                            endIndent: 60.w,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 33.h),

                    ///will be add google btn
                    //animated_toggle_switch
                    AnimatedToogleSwitchWidget(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
