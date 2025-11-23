import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_assets.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/core/widgets/custom_shimmer_home_tab.dart';
import 'package:movie_app/feature/home/hometab/ui/viewmodel/list_movie/list_movie_cubit.dart';
import 'package:movie_app/feature/home/hometab/ui/viewmodel/list_movie/list_movie_state.dart';
import 'package:movie_app/feature/home/hometab/ui/views/widgets/custom_carousel_slider.dart';

class HomeTabBody extends StatelessWidget {
  const HomeTabBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListMovieCubit, ListMovieState>(
      builder: (context, state) {
        if (state is ListMovieLoadingState) {
          return CustomShimmerHomeTab();
        } else if (state is ListMovieFailureState) {
          return Text(state.failure.failureMessage);
        } else if (state is ListMovieSuccessState) {
          return SingleChildScrollView(
            child: Stack(
              children: [
                //will be change to cached network image
                // SizedBox(
                //   height: 645.h,
                //   child: ListView.builder(
                //     itemCount: state.listMovieResponseEntity.movies.length,
                //     itemBuilder: (context, index) => CachedNetworkImage(
                //       imageUrl: state
                //           .listMovieResponseEntity
                //           .movies[index]
                //           .largeCoverImage,
                //     ),
                //   ),
                // ),
                // Positioned.fill(
                //   child: Container(
                //     decoration: BoxDecoration(
                //       gradient: LinearGradient(
                //         colors: [
                //           AppColors.black0Percent,
                //           AppColors.black60Percent,
                //           AppColors.black,
                //         ],
                //         begin: Alignment.topCenter,
                //         end: Alignment.bottomCenter,
                //       ),
                //     ),
                //   ),
                // ),
                SafeArea(
                  child: Column(
                    children: [
                      Image.asset(
                        AppAssets.availableNowImage,
                        width: 167.w,
                        height: 67.h,
                      ),
                      CustomCarouselSlider(
                        moviesList: state.listMovieResponseEntity.movies,
                      ),
                      ////////////////////
                      Image.asset(
                        AppAssets.watchNowImage,
                        width: 354.w,
                        height: 146.h,
                      ),
                      SizedBox(height: 30.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text('Category', style: AppStyles.w400S20White),
                                Spacer(),
                                Text(
                                  AppStrings.seeMore,
                                  style: AppStyles.w400S16Yellow,
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right_outlined,
                                  color: AppColors.yellow,
                                ),
                              ],
                            ),
                            SizedBox(height: 8.h),
                            SizedBox(
                              height: 250.h,
                              child: ListView.separated(
                                separatorBuilder: (context, index) =>
                                    SizedBox(width: 16.w),
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    state.listMovieResponseEntity.movies.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        AppRoutes.movieDetailsViews,
                                        arguments: state
                                            .listMovieResponseEntity
                                            .movies[index]
                                            .id
                                            .toString(),
                                      );
                                    },
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadiusGeometry.circular(
                                                20.r,
                                              ),
                                          child: CachedNetworkImage(
                                            imageUrl: state
                                                .listMovieResponseEntity
                                                .movies[index]
                                                .mediumCoverImage,
                                            fit: BoxFit.cover,
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
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              color: AppColors.darkGreenGray,
                                            ),
                                            child: Row(
                                              children: [
                                                Text(
                                                  state
                                                      .listMovieResponseEntity
                                                      .movies[index]
                                                      .rating
                                                      .toString(),
                                                  style: AppStyles.w400S16White,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: AppColors.yellow,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return Text('oops');
      },
    );
  }
}
