import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/core/widgets/custom_elevate_btn.dart';
import 'package:movie_app/feature/home/profiletab/domain/entities/favorite_movie_entity.dart';

class CustomMovieFavItem extends StatelessWidget {
  const CustomMovieFavItem({super.key, required this.movieFavData});

  final FavoriteMovieEntity movieFavData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: AppColors.darkGreenGray,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.yellow),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // الاسم
          Text(
            movieFavData.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 4.h),

          // السنة
          Text(
            movieFavData.year,
            style: TextStyle(color: AppColors.grey, fontSize: 14.sp),
          ),

          SizedBox(height: 8.h),

          // التقييم
          Row(
            children: [
              Icon(Icons.star, color: AppColors.yellow, size: 16.sp),
              SizedBox(width: 4.w),
              Text(
                movieFavData.rating.toString(),
                style: TextStyle(color: AppColors.yellow, fontSize: 14.sp),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          CustomElevateBtn(
            text: AppStrings.showDetails.tr(),
            style: AppStyles.w400S16White,
            onPressed: () {
              Navigator.pushNamed(
                context,
                AppRoutes.movieDetailsViews,
                arguments: movieFavData.movieId,
              );
            },
          ),
        ],
      ),
    );
  }
}
