import 'package:cached_network_image/cached_network_image.dart';
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

class MovieDetailsView extends StatefulWidget {
  const MovieDetailsView({super.key});

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  // @override
  // void initState() {
  //   super.initState();
  //   final addToHistoryCubit = getIt<AddToHistoryCubit>();
  //   final movieDetailsCubit = getIt<MovieDetailsCubit>();

  //   // Use addPostFrameCallback to safely access context
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     final movieId = ModalRoute.of(context)!.settings.arguments as String;

  //     // Load movie details
  //     movieDetailsCubit.getMovieDetailsById(movieId);

  //     // Listen for successful load to add to history
  //     movieDetailsCubit.stream.listen((state) {
  //       if (state is MovieDetailsSuccessState) {
  //         final movie = state.movieDetailsResponseEntity.movie;
  //         addToHistoryCubit.addToHistory(
  //           HistoryMovieEntity(
  //             movieId: movie.id.toString(),
  //             title: movie.title,
  //             rating: movie.rating,
  //             imageUrl: movie.largeCoverImage,
  //           ),
  //         );
  //       }
  //     });
  //   });
  // }

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
                            // final String url = movieDetailsItem
                            //     .url; // الرابط اللي جالك من ال API
                            // final Uri uri = Uri.parse(url);
                            // if (await canLaunchUrl(uri)) {
                            //   await launchUrl(
                            //     uri,
                            //     mode: LaunchMode
                            //         .externalApplication, // يفتح المتصفح
                            //   );
                            // } else {
                            //   print("Could not launch $url");
                            // }
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
                          AppStrings.screenShots,
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
                        Text(AppStrings.summary, style: AppStyles.w700S24White),
                        SizedBox(height: 8.h),
                        ReadMoreText(
                          movieDetailsItem.descriptionIntro,
                          style: AppStyles.w400S16White,
                          trimMode: TrimMode.Line,
                          trimLines: 7,
                          trimExpandedText: ' Read Less',
                          trimCollapsedText: ' Read More',
                          moreStyle: AppStyles.w600S20Yellow,
                          lessStyle: AppStyles.w600S20Yellow,
                        ),
                        SizedBox(height: 16.h),
                        Text(AppStrings.genres, style: AppStyles.w700S24White),
                        SizedBox(height: 8.h),

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

                        /// similar
                        Text(AppStrings.similar, style: AppStyles.w700S24White),
                        SizedBox(height: 8.h),
                        MovieSuggestion(),
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