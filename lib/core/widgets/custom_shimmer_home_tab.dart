import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:movie_app/core/utils/app_colors.dart';

class CustomShimmerHomeTab extends StatelessWidget {
  const CustomShimmerHomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 50.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Shimmer.fromColors(
            baseColor: AppColors.darkGreenGray,
            highlightColor: AppColors.grey,
            child: Container(
              width: screenWidth - 32.w,
              height: 28.h,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 50.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(3, (_) {
              return Shimmer.fromColors(
                baseColor: AppColors.darkGreenGray,
                highlightColor: AppColors.grey,
                child: Container(
                  width: (screenWidth - 48.w) / 3,
                  height: 140.h,
                  color: Colors.white,
                ),
              );
            }),
          ),
        ),
        SizedBox(height: 50.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Shimmer.fromColors(
            baseColor: AppColors.darkGreenGray,
            highlightColor: AppColors.grey,
            child: Container(
              width: screenWidth - 32.w,
              height: 160.h,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 50.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Shimmer.fromColors(
                baseColor: AppColors.darkGreenGray,
                highlightColor: AppColors.grey,
                child: Container(
                  width: 140.w,
                  height: 28.h,
                  color: Colors.white,
                ),
              ),
              Shimmer.fromColors(
                baseColor: AppColors.darkGreenGray,
                highlightColor: AppColors.grey,
                child: Container(
                  width: 28.w,
                  height: 28.h,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 50.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(3, (_) {
              return Shimmer.fromColors(
                baseColor: AppColors.darkGreenGray,
                highlightColor: AppColors.grey,
                child: Container(
                  width: (screenWidth - 48.w) / 3,
                  height: 140.h,
                  color: Colors.white,
                ),
              );
            }),
          ),
        ),
        SizedBox(height: 30.h),
      ],
    );
  }
}
