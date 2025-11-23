import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_styles.dart';

class CustomRowIconWithTextItem extends StatelessWidget {
  final IconData icon;
  final String text;
  const CustomRowIconWithTextItem({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.darkGreenGray,
      ),
      child: Row(
        spacing: 10,
        children: [
          Icon(icon, color: AppColors.yellow, size: 28.sp),
          Text(text, style: AppStyles.w700S24White),
        ],
      ),
    );
  }
}
