import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/core/utils/app_assets.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/feature/home/profiletab/ui/viewmodel/get_favorite_movie/get_favorite_movie_cubit.dart';
import 'package:movie_app/feature/home/profiletab/ui/viewmodel/get_favorite_movie/get_favorite_movie_state.dart';
import 'package:movie_app/feature/home/profiletab/ui/views/widgets/custom_movie_fav_item.dart';

class ProfileTabs extends StatelessWidget {
  const ProfileTabs({super.key});

  @override
  Widget build(BuildContext context) {
    // GetFavoriteMoviesCubit getFavoriteMoviesCubit =
    //     getIt<GetFavoriteMoviesCubit>();
    return DefaultTabController(
      length: 1,
      child: Expanded(
        child: Column(
          children: [
            TabBar(
              dividerColor: AppColors.transparent,
              indicatorColor: AppColors.yellow,
              labelColor: AppColors.yellow,
              unselectedLabelColor: AppColors.white,
              tabs: [
                Tab(
                  icon: Icon(Icons.list, color: AppColors.yellow),
                  child: Text(
                    AppStrings.watchList,
                    style: AppStyles.w700S20Wite,
                  ),
                ),
                // Tab(
                //   icon: Icon(Icons.folder, color: AppColors.yellow),
                //   child: Text(AppStrings.history, style: AppStyles.w700S20Wite),
                // ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  /// watch list
                  CustomMovieIProfilsNotEmpty(),

                  /// History Tab
                  // CustomMovieProfileIsEmpty(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomMovieProfileIsEmpty extends StatelessWidget {
  const CustomMovieProfileIsEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          AppAssets.emptySerachLottieImage,
          height: 124.h,
          width: 124.w,
        ),
        // Image.asset(AppAssets.searchEmptyImage, height: 124.h, width: 124.w),
      ],
    );
  }
}

class CustomMovieIProfilsNotEmpty extends StatelessWidget {
  const CustomMovieIProfilsNotEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFavoriteMoviesCubit, GetFavoriteMoviesState>(
      // bloc: getFavoriteMoviesCubit..getFavorites(),
      builder: (context, state) {
        if (state is GetFavoriteMoviesLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is GetFavoriteMoviesError) {
          return Center(
            child: Text(
              state.failure.failureMessage,
              style: AppStyles.w400S14White,
            ),
          );
        } else if (state is GetFavoriteMoviesSuccess) {
          if (state.response.data.isEmpty) {
            return CustomMovieProfileIsEmpty();
          } else {
            return GridView.builder(
              itemCount: state.response.data.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 8.h,
                // childAspectRatio: 191 / 279.r,
              ),
              itemBuilder: (context, index) {
                var movieFavData = state.response.data[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.movieDetailsViews,
                      arguments: movieFavData.movieId,
                    );
                  },
                  child: CustomMovieFavItem(movieFavData: movieFavData),
                );
              },
            );
          }
        }
        return Center(child: Text('oops', style: AppStyles.w400S14White));
      },
    );
  }
}
