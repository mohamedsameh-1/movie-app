import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/di/di.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/core/widgets/custom_elevate_btn.dart';
import 'package:movie_app/feature/home/movie_details/ui/viewmodel/movie_details/movie_details_cubit.dart';
import 'package:movie_app/feature/home/movie_details/ui/views/widgets/movie_suggestion.dart';
import 'package:movie_app/feature/home/profiletab/ui/viewmodel/favorite_add/add_favorite_movie_cubit.dart';
import 'package:movie_app/feature/home/profiletab/ui/viewmodel/favorite_add/add_favorite_movie_state.dart';
import 'package:movie_app/feature/home/ui/views/widgets/custom_row_icon_with_text.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

import '../viewmodel/movie_details/movie_details_state.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key});

  // @override
  @override
  Widget build(BuildContext context) {
    MovieDetailsCubit movieDetailsCubit = getIt<MovieDetailsCubit>();
    AddFavoriteCubit addFavoriteCubit = getIt<AddFavoriteCubit>();
    // RemoveFavoriteMovieCubit removeFavoriteCubit =
    //     getIt<RemoveFavoriteMovieCubit>();
    // MovieSuggestionCubit movieSuggestionCubit = getIt<MovieSuggestionCubit>();
    final movieIdArgument =
        ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocConsumer<AddFavoriteCubit, AddFavoriteState>(
            bloc: addFavoriteCubit,
            listener: (context, state) {},
            builder: (context, state) {
              return BlocBuilder(
                bloc: movieDetailsCubit,
                builder: (context, dState) {
                  if (dState is MovieDetailsSuccessState) {
                    final movie = dState.movieDetailsResponseEntity.movie;
                    return IconButton(
                      onPressed: () {
                        addFavoriteCubit.addToFavorite(
                          movie.id.toString(),
                          movie.title,
                          movie.rating,
                          movie.url,
                          movie.year.toString(),
                        );
                        print('added movie to fav ${movie.title}');
                      },
                      icon: Icon(Icons.bookmark_border_outlined),
                    );
                  }
                  return Icon(Icons.bookmark_border_outlined);
                },
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        bloc: movieDetailsCubit..getMovieDetailsById(movieIdArgument),
        builder: (context, state) {
          if (state is MovieDetailsLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is MovieDetailsFailureState) {
            return Center(
              child: Center(
                child: Text(
                  state.failure.failureMessage,
                  style: AppStyles.w700S24White,
                ),
              ),
            );
          } else if (state is MovieDetailsSuccessState) {
            var movieDetailsItem = state.movieDetailsResponseEntity.movie;
            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      ///image
                      CachedNetworkImage(
                        imageUrl: movieDetailsItem.largeCoverImage,
                        height: 400.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) => const Icon(
                          Icons.broken_image,
                          size: 40,
                          color: AppColors.grey,
                        ),
                      ),

                      ///gradient opacity
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColors.black0Percent,
                                AppColors.black60Percent,
                                AppColors.black,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ),

                      ///title
                      Positioned(
                        bottom: 0,
                        child: Column(
                          children: [
                            Text(
                              movieDetailsItem.title,
                              style: AppStyles.w700S24White,
                            ),
                            Text(
                              movieDetailsItem.year.toString(),
                              // '2022',
                              style: AppStyles.w700S20Grey,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///btn click
                        CustomElevateBtn(
                          text: 'Watch',
                          onPressed: () async {
                            await launchUrl(Uri.parse(movieDetailsItem.url));
                          },
                          backgroundColor: AppColors.red,
                          style: AppStyles.w400S20White,
                        ),
                        SizedBox(height: 16.h),

                        /// fav, time of movie, rating
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomRowIconWithTextItem(
                              icon: Icons.favorite,
                              text: movieDetailsItem.likeCount.toString(),
                            ),
                            CustomRowIconWithTextItem(
                              icon: Icons.watch_later_rounded,
                              text: movieDetailsItem.runtime.toString(),
                            ),
                            CustomRowIconWithTextItem(
                              icon: Icons.star,
                              text: movieDetailsItem.rating.toString(),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          AppStrings.screenShots.tr(),
                          style: AppStyles.w700S24White,
                        ),
                        SizedBox(height: 8.h),

                        /// images of movie
                        ImageWithRaduisItem(
                          imageUrl: movieDetailsItem.backgroundImageOriginal,
                        ),
                        ImageWithRaduisItem(
                          imageUrl: movieDetailsItem.mediumCoverImage,
                        ),
                        SizedBox(height: 16.h),

                        /// summary text
                        SizedBox(height: 16.h),
                        Text(
                          AppStrings.summary.tr(),
                          style: AppStyles.w700S24White,
                        ),
                        SizedBox(height: 8.h),
                        ReadMoreText(
                          movieDetailsItem.descriptionIntro,
                          style: AppStyles.w400S16White,
                          trimMode: TrimMode.Line,
                          trimLines: 7,
                          trimExpandedText: AppStrings.readLess.tr(),
                          trimCollapsedText: AppStrings.readMore.tr(),
                          moreStyle: AppStyles.w600S20Yellow,
                          lessStyle: AppStyles.w600S20Yellow,
                        ),

                        /// similar
                        SizedBox(height: 16.h),
                        Text(
                          AppStrings.similar.tr(),
                          style: AppStyles.w700S24White,
                        ),
                        MovieSuggestion(),

                        SizedBox(height: 16.h),
                        Text(
                          AppStrings.genres.tr(),
                          style: AppStyles.w700S24White,
                        ),
                        SizedBox(height: 16.h),

                        /// genres
                        Wrap(
                          spacing: 4.w,
                          runSpacing: 11.h,
                          children: movieDetailsItem.genres
                              .map(
                                (gener) => Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 38.w,
                                    vertical: 8.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.darkGreenGray,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    gener,
                                    style: AppStyles.w400S16White,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        SizedBox(height: 30.h),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Text('oops');
          }
        },
      ),
    );
  }
}

class ImageWithRaduisItem extends StatelessWidget {
  final String imageUrl;
  const ImageWithRaduisItem({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(16.r),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          height: 167.h,
          width: double.infinity,
          fit: BoxFit.fill,
          errorWidget: (context, url, error) =>
              const Icon(Icons.broken_image, size: 40, color: AppColors.grey),
        ),
      ),
    );
  }
}



                        /// cast
                        // SizedBox(height: 16.h),
                        // Text(AppStrings.cast, style: AppStyles.w700S24White),
                        // SizedBox(height: 8.h),
                        // ListView.separated(
                        //   shrinkWrap: true,
                        //   physics: NeverScrollableScrollPhysics(),
                        //   separatorBuilder: (context, index) =>
                        //       SizedBox(height: 8.h),
                        //   itemCount: 3,
                        //   itemBuilder: (context, index) {
                        //     return Container(
                        //       decoration: BoxDecoration(
                        //         color: AppColors.darkGreenGray,
                        //         borderRadius: BorderRadius.circular(16.r),
                        //       ),
                        //       child: ListTile(
                        //         leading: ClipRRect(
                        //           borderRadius: BorderRadiusGeometry.circular(
                        //             10.r,
                        //           ),
                        //           child: Image.asset(AppAssets.avatar1Image),
                        //         ),
                        //         title: Text(
                        //           'Name : Hayley Atwell',
                        //           style: AppStyles.w400S20White,
                        //         ),
                        //         subtitle: Text(
                        //           'Character : Captain Carter',
                        //           style: AppStyles.w400S20White,
                        //         ),
                        //       ),
                        //     );
                        //   },
                        // ),