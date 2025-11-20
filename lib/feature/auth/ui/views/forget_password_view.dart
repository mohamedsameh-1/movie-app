import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_assets.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/core/widgets/custom_elevate_btn.dart';
import 'package:movie_app/core/widgets/custom_text_field.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.forgetPasswordAppBar,
          style: AppStyles.w400S16Yellow,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                AppAssets.forgotPasswordImage,
                height: 430.h,
                width: 430.w,
              ),
              CustomTextField(
                hintText: AppStrings.email,
                prefixIcon: Icon(Icons.email),
              ),
              SizedBox(height: 24.h),
              CustomElevateBtn(text: AppStrings.verifyEmail, onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
