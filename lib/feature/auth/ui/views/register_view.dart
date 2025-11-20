import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/di/di.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/core/utils/app_validator.dart';
import 'package:movie_app/core/widgets/animated_toogle_switch_widget.dart';
import 'package:movie_app/core/widgets/custom_elevate_btn.dart';
import 'package:movie_app/core/widgets/custom_message_dialog.dart';
import 'package:movie_app/core/widgets/custom_text_field.dart';
import 'package:movie_app/feature/auth/ui/viewmodel/register/register_cubit.dart';
import 'package:movie_app/feature/auth/ui/viewmodel/register/register_state.dart';
import 'package:movie_app/feature/auth/ui/views/widgets/custom_avatar_list_view_builder.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterCubit registerCubit = getIt<RegisterCubit>();
    return BlocProvider(
      create: (context) => registerCubit,
      child: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterLoadingState) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const CustomMessageDialog(
                message: 'Loading...',
                type: MessageType.loading,
              ),
            );
          } else if (state is RegisterFailureState) {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (_) => CustomMessageDialog(
                message: state.failure.failureMessage,
                type: MessageType.error,
              ),
            );
          } else if (state is RegisterSuccessState) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.registerResponseEntity.message),
                backgroundColor: AppColors.green,
              ),
            );

            /// saved token in cubit file
            Navigator.pushReplacementNamed(context, AppRoutes.homeViews);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(AppStrings.register, style: AppStyles.w400S16Yellow),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Form(
                key: registerCubit.formKey,
                child: Column(
                  spacing: 24.h,
                  children: [
                    CustomAvatarListViewBuilder(),
                    CustomTextField(
                      hintText: AppStrings.name,
                      prefixIcon: Icon(Icons.person_3_sharp),
                      controller: registerCubit.nameController,
                    ),
                    CustomTextField(
                      hintText: AppStrings.email,
                      prefixIcon: Icon(Icons.email),
                      controller: registerCubit.emailController,
                      validator: AppValidator.validateEmail,
                    ),
                    BlocBuilder<RegisterCubit, RegisterState>(
                      builder: (context, state) {
                        return CustomTextField(
                          controller: registerCubit.passwordController,
                          validator: AppValidator.validatePassword,
                          hintText: AppStrings.password,
                          prefixIcon: Icon(Icons.lock),
                          obscureText: registerCubit.isPassVisibilityOff,
                          suffixIcon: IconButton(
                            onPressed: () {
                              registerCubit.changePassVisibility();
                            },
                            icon: Icon(
                              registerCubit.isPassVisibilityOff
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        );
                      },
                    ),
                    BlocBuilder<RegisterCubit, RegisterState>(
                      builder: (context, state) {
                        return CustomTextField(
                          controller: registerCubit.confirmPasswordtroller,
                          validator: (value) =>
                              AppValidator.validateConfirmPassword(
                                registerCubit.passwordController!.text,
                                value,
                              ),
                          hintText: AppStrings.confirmPassword,
                          prefixIcon: Icon(Icons.lock),
                          obscureText: registerCubit.isCnfirmPassVisibilityOff,
                          suffixIcon: IconButton(
                            onPressed: () {
                              registerCubit.changeConfirmPassVisibility();
                            },
                            icon: Icon(
                              registerCubit.isCnfirmPassVisibilityOff
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        );
                      },
                    ),
                    CustomTextField(
                      controller: registerCubit.phoneController,
                      validator: AppValidator.validatePhone,
                      hintText: AppStrings.phoneNumber,
                      prefixIcon: Icon(Icons.phone),
                    ),
                    CustomElevateBtn(
                      text: AppStrings.createAccount,
                      onPressed: () {
                        registerCubit.register();
                        // print({
                        //   "name": registerCubit.nameController!.text,
                        //   "email": registerCubit.emailController!.text,
                        //   "password": registerCubit.passwordController!.text,
                        //   "confirmPassword":
                        //       registerCubit.confirmPasswordtroller!.text,
                        //   "phone": registerCubit.phoneController!.text,
                        //   "avaterId": registerCubit.selectedAvatarIndex + 1,
                        // });
                      },
                    ),
                    Text.rich(
                      TextSpan(
                        text: AppStrings.alreadyHaveAccount,
                        style: AppStyles.w400S14White,
                        children: [
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                AppStrings.login,
                                style: AppStyles.w400S14Yellow,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    AnimatedToogleSwitchWidget(),
                  ],
                ),
              ),
            ),
          ),
        ),
        // },
      ),
    );
  }
}
