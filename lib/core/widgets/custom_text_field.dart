import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_styles.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? prefixIconColor;
  final TextStyle? hintStyle;
  final Color? borderColor;
  final Color? cursorColor;
  final TextStyle? style;
  final int? maxLines;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final TextInputType? keyboardType;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixIconColor,
    this.hintStyle,
    this.borderColor,
    this.cursorColor,
    this.style,
    this.maxLines,
    this.controller,
    this.validator,
    this.obscureText,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      cursorColor: cursorColor ?? AppColors.white,
      style: style ?? AppStyles.w400S16White,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        fillColor: AppColors.darkGreenGray,
        filled: true,
        enabledBorder: customOutlineInputBorder(borderColor: borderColor),
        focusedBorder: customOutlineInputBorder(borderColor: borderColor),
        errorBorder: customOutlineInputBorder(borderColor: AppColors.red),
        focusedErrorBorder: customOutlineInputBorder(
          borderColor: AppColors.red,
        ),
        prefixIcon: prefixIcon,
        // prefixIconColor: prefixIconColor ?? AppColors.grey,
        hintText: hintText,
        hintStyle: hintStyle ?? AppStyles.w400S16White,
        suffixIcon: suffixIcon,
      ),
    );
  }

  OutlineInputBorder customOutlineInputBorder({required Color? borderColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      // borderSide: BorderSide(color: borderColor ?? AppColors.grey),
    );
  }
}
