import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/core/utils/app_styles.dart';

class ResetPasswordItem extends StatelessWidget {
  const ResetPasswordItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.resetPassword);
        },
        child: Text(AppStrings.resetPassword, style: AppStyles.w400S20White),
      ),
    );
  }
}
