import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/feature/home/hometab/domain/entities/list_movie_entity.dart';

class CustomGridViewOfMovie extends StatelessWidget {
  const CustomGridViewOfMovie({super.key, required this.movies});

  final List<MovieEntity> movies;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: movies.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20.w,
        mainAxisSpacing: 8.h,
        childAspectRatio: 189 / 279.r,
      ),
      itemBuilder: (context, movieIndex) {
        return Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.movieDetailsViews,
                    arguments: movies[movieIndex].id.toString(),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(20.r),
                  child: CachedNetworkImage(
                    imageUrl: movies[movieIndex].mediumCoverImage,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => const Icon(
                      Icons.broken_image,
                      size: 40,
                      color: AppColors.grey,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 9.w,
              top: 11.h,
              child: Container(
                // width: 58.w,
                // height: 28.h,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: AppColors.darkGreenGray,
                ),
                child: Row(
                  children: [
                    Text(
                      movies[movieIndex].rating.toString(),
                      // '7.7',
                      // state
                      //     .listMovieResponseEntity
                      //     .movies[index]
                      //     .rating
                      //     .toString(),
                      style: AppStyles.w400S16White,
                    ),
                    Icon(Icons.star, color: AppColors.yellow),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
