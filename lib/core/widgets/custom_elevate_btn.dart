import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_styles.dart';

class CustomElevateBtn extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final Color? backgroundColor;
  final TextStyle? style;
  const CustomElevateBtn({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size.fromWidth(3000),
        backgroundColor: backgroundColor ?? AppColors.yellow,
        // foregroundColor: AppColors.lightBlueff,
        padding: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
        ),
      ),
      onPressed: onPressed,
      child: Text(text, style: style ?? AppStyles.w400S20Black),
    );
  }
}
