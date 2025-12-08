import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/di/di.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/core/widgets/custom_elevate_btn.dart';
import 'package:movie_app/core/widgets/custom_message_dialog.dart';
import 'package:movie_app/core/widgets/custom_text_field.dart';
import 'package:movie_app/feature/home/profiletab/ui/viewmodel/reset_password/reset_password_cubit.dart';
import 'package:movie_app/feature/home/profiletab/ui/viewmodel/reset_password/reset_password_state.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    ResetPasswordCubit resetPasswordCubit = getIt<ResetPasswordCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.resetPassword.tr(),
          style: AppStyles.w400S16White,
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
        bloc: resetPasswordCubit,
        listener: (context, state) {
          if (state is ResetPasswordLoadingState) {
            showDialog(
              context: context,
              builder: (context) => CustomMessageDialog(
                message: AppStrings.loading.tr(),
                type: MessageType.loading,
              ),
            );
          }
          if (state is ResetPasswordFailureState) {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) {
                return CustomMessageDialog(
                  message: state.failure.failureMessage,
                  type: MessageType.error,
                );
              },
            );
          } else if (state is ResetPasswordSuccessState) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.resetPasswordResponseEntity.message,
                  style: AppStyles.w400S14White,
                ),
                backgroundColor: AppColors.green,
                duration: Duration(seconds: 2),
              ),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Form(
              key: resetPasswordCubit.formKey,
              child: Column(
                children: [
                  SizedBox(height: 30.h),
                  CustomTextField(
                    prefixIcon: Icon(Icons.lock, color: AppColors.grey),
                    hintText: AppStrings.oldPassword.tr(),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: resetPasswordCubit.isOldPasswordVisibilityOff,
                    controller: resetPasswordCubit.oldPassController,
                    suffixIcon: IconButton(
                      onPressed: () {
                        resetPasswordCubit.changeVisibilityOldPassword();
                      },
                      icon: Icon(
                        resetPasswordCubit.isOldPasswordVisibilityOff
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  CustomTextField(
                    prefixIcon: Icon(Icons.lock, color: AppColors.grey),
                    hintText: AppStrings.newPassword.tr(),
                    keyboardType: TextInputType.visiblePassword,
                    controller: resetPasswordCubit.newPassController,
                    obscureText: resetPasswordCubit.isNewPasswordVisibilityOff,
                    suffixIcon: IconButton(
                      onPressed: () {
                        resetPasswordCubit.changeVisibilityNewPassword();
                      },
                      icon: Icon(
                        resetPasswordCubit.isNewPasswordVisibilityOff
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                  SizedBox(height: 70.h),
                  CustomElevateBtn(
                    text: AppStrings.resetPassword.tr(),
                    onPressed: () {
                      resetPasswordCubit.resetPassword();
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
