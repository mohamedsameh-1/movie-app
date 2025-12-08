import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/core/widgets/custom_elevate_btn.dart';
import 'package:movie_app/feature/home/profiletab/ui/viewmodel/get_profile_cubit/get_profile_cubit.dart';
import 'package:movie_app/feature/home/profiletab/ui/viewmodel/get_profile_cubit/get_profile_state.dart';
import 'package:movie_app/feature/home/profiletab/ui/viewmodel/log_out/log_out_cubit.dart';
import 'package:movie_app/feature/home/profiletab/ui/viewmodel/log_out/log_out_state.dart';

class ProfileButtons extends StatelessWidget {
  const ProfileButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.w,
      children: [
        BlocBuilder<GetProfileCubit, GetProfileState>(
          builder: (context, state) {
            return Expanded(
              flex: 2,
              child: CustomElevateBtn(
                text: AppStrings.editProfile.tr(),
                onPressed: () {
                  if (state is GetProfileSuccessState) {
                    final prfileData = state.getProfileResponseEntity.data;
                    Navigator.pushNamed(
                      context,
                      AppRoutes.editProfileViews,
                      arguments: {
                        "email": prfileData.email,
                        "name": prfileData.name,
                        "phone": prfileData.phone,
                        "avatarId": prfileData.avaterId,
                      },
                    );
                  }
                },
              ),
            );
          },
        ),
        BlocProvider(
          create: (context) => LogOutCubit(),
          child: BlocConsumer<LogOutCubit, LogOutState>(
            listener: (context, state) {
              if (state is LogOutSuccessState) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.logIn,
                  (route) => false,
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      AppStrings.logOutSuccess.tr(),
                      style: AppStyles.w400S16White,
                    ),
                    backgroundColor: AppColors.green,
                    // behavior: SnackBarBehavior.floating,
                    // margin: EdgeInsets.all(16.r),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
            builder: (context, state) {
              return Expanded(
                child: CustomElevateBtn(
                  text: AppStrings.exit.tr(),
                  onPressed: () {
                    context.read<LogOutCubit>().logOut();
                  },
                  style: AppStyles.w400S20White,
                  backgroundColor: AppColors.red,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
