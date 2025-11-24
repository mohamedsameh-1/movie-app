import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/feature/home/hometab/domain/entities/list_movie_entity.dart';

class CustomCarouselSlider extends StatelessWidget {
  final List<MovieEntity> moviesList;
  const CustomCarouselSlider({super.key, required this.moviesList});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: moviesList.length,
      itemBuilder: (BuildContext context, int index, int pageViewIndex) {
        // var listOfMovie = state.listMovieResponseEntity.movies[index];
        return Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.movieDetailsViews,
                    arguments: moviesList[index].id.toString(),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(20.r),

                  /// will be change to cached network image
                  child: CachedNetworkImage(
                    imageUrl: moviesList[index].mediumCoverImage,
                    height: 277.h,
                    fit: BoxFit.cover,
                    width: 184.w,
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
                      moviesList[index].rating.toString(),
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
      options: CarouselOptions(
        height: 277.h,
        // aspectRatio: 0.66.h,
        autoPlay: true,
        enableInfiniteScroll: true,
        // autoPlayInterval: Duration(seconds: 5),
        viewportFraction: 0.4.w,
        enlargeCenterPage: true,
        // enlargeFactor: 0.5,
      ),
    );
  }
}
