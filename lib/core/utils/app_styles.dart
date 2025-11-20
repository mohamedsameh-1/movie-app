import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/utils/app_colors.dart';

abstract class AppStyles {
  static TextStyle w700S24White = GoogleFonts.inter(
    fontWeight: FontWeight.w700,
    fontSize: 24.sp,
    color: AppColors.white,
  );
  static TextStyle w400S20White = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 20.sp,
    color: AppColors.white,
  );
  static TextStyle w400S20Black = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 20.sp,
    color: AppColors.black,
  );
  static TextStyle w600S20Black = GoogleFonts.inter(
    fontWeight: FontWeight.w600,
    fontSize: 20.sp,
    color: AppColors.black,
  );
  static TextStyle w600S20Yellow = GoogleFonts.inter(
    fontWeight: FontWeight.w600,
    fontSize: 20.sp,
    color: AppColors.yellow,
  );
  static TextStyle w400S16White = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
    color: AppColors.white,
  );
  static TextStyle w400S16Yellow = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
    color: AppColors.yellow,
  );
  static TextStyle w400S14Yellow = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    color: AppColors.yellow,
  );
  static TextStyle w400S14White = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    color: AppColors.white,
  );
}
