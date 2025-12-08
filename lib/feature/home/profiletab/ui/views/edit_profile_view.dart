import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/di/di.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/core/utils/shared_prefrence.dart';
import 'package:movie_app/core/widgets/custom_elevate_btn.dart';
import 'package:movie_app/core/widgets/custom_message_dialog.dart';
import 'package:movie_app/core/widgets/custom_text_field.dart';
import 'package:movie_app/feature/home/profiletab/ui/viewmodel/delete_account/delete_account_cubit.dart';
import 'package:movie_app/feature/home/profiletab/ui/viewmodel/delete_account/delete_account_state.dart';
import 'package:movie_app/feature/home/profiletab/ui/views/widgets/reset_password_item.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    TextEditingController? emailController = TextEditingController(
      text: args['email'],
    );
    TextEditingController? nameController = TextEditingController(
      text: args['name'],
    );
    TextEditingController? phoneController = TextEditingController(
      text: args['phone'],
    );
    DeleteAccountCubit deleteAccountCubit = getIt<DeleteAccountCubit>();

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          children: [
            Image.asset(
              AppStrings.avatars[args['avatarId'] - 1],
              height: 150.r,
              width: 150.r,
            ),
            SizedBox(height: 35.h),
            CustomTextField(
              enabled: false,
              controller: emailController,
              prefixIcon: Icon(Icons.email),
              hintText: '',
            ),
            SizedBox(height: 20.h),
            CustomTextField(
              enabled: false,
              controller: nameController,
              prefixIcon: Icon(Icons.person),
              hintText: '',
            ),
            SizedBox(height: 20.h),
            CustomTextField(
              enabled: false,
              controller: phoneController,
              prefixIcon: Icon(Icons.phone),
              hintText: '',
            ),
            SizedBox(height: 30.h),
            ResetPasswordItem(),
            // SizedBox(height: 200.h),
            Spacer(),
            BlocProvider(
              create: (context) => deleteAccountCubit,
              child: DeleteAccountItem(),
            ),
            SizedBox(height: 16.h),
            // CustomElevateBtn(text: AppStrings.updateData, onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

class DeleteAccountItem extends StatelessWidget {
  const DeleteAccountItem({super.key});

  @override
  Widget build(BuildContext context) {
    // DeleteAccountCubit deleteAccountCubit = getIt<DeleteAccountCubit>();
    return BlocConsumer<DeleteAccountCubit, DeleteAccountState>(
      listener: (context, state) {
        if (state is DeleteAccountLoadingState) {
          showDialog(
            context: context,
            builder: (context) {
              return CustomMessageDialog(
                message: AppStrings.loading.tr(),
                type: MessageType.loading,
              );
            },
          );
        } else if (state is DeleteAccountFailureState) {
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
        } else if (state is DeleteAccountSuccessState) {
          Navigator.pop(context);
          SharedPreference.remove(AppStrings.tokenOfLoggedInOrCreatedAccount);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                AppStrings.deleteAccountSuccessfully.tr(),
                style: AppStyles.w400S16White,
              ),
              backgroundColor: AppColors.green,
              duration: Duration(seconds: 2),
            ),
          );
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.logIn,
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        return CustomElevateBtn(
          text: AppStrings.deleteAccount.tr(),
          style: AppStyles.w400S20White,
          onPressed: () {
            context.read<DeleteAccountCubit>().deleteAccount();
          },
          backgroundColor: AppColors.red,
        );
      },
    );
  }
}
