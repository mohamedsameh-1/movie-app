import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:movie_app/core/utils/app_assets.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/core/widgets/custom_elevate_btn.dart';
import 'package:movie_app/core/widgets/custom_text_field.dart';

class LogInViews extends StatelessWidget {
  const LogInViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(AppAssets.mainImage),
          CustomTextField(
            hintText: AppStrings.login,
            prefixIcon: Icon(Icons.email),
          ),
          CustomTextField(
            hintText: AppStrings.password,
            prefixIcon: Icon(Icons.lock),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              AppStrings.forgetPassword,
              style: AppStyles.w400S14Yellow,
            ),
          ),
          CustomElevateBtn(text: AppStrings.login, onPressed: () {}),
          Text.rich(
            TextSpan(
              text: AppStrings.dontHaveAccount,
              style: AppStyles.w400S14White,
              children: [
                WidgetSpan(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(AppStrings.createOne),
                  ),
                ),
              ],
            ),
          ),
          // Row(
          //   children: [
          //     Divider(),

          //   ],
          // ),
        ],
      ),
    );
  }
}
