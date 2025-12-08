import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/core/di/di.dart';
import 'package:movie_app/core/utils/app_assets.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/core/widgets/custom_text_field.dart';
import 'package:movie_app/feature/home/hometab/domain/entities/list_movie_entity.dart';
import 'package:movie_app/feature/home/searchtab/ui/view_model/search_movie_cubit.dart';
import 'package:movie_app/feature/home/searchtab/ui/view_model/search_movie_state.dart';

class SearchTabView extends StatelessWidget {
  // TextEditingController? searchController = TextEditingController();
  const SearchTabView({super.key});

  @override
  Widget build(BuildContext context) {
    SearchMovieCubit searchMovieCubit = getIt<SearchMovieCubit>();
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Column(
          children: [
            CustomTextField(
              // controller: searchController,
              onChanged: (value) {
                if (value.isEmpty) {
                  searchMovieCubit.clearSearch();
                } else {
                  searchMovieCubit.getListMovie(value);
                }
              },
              prefixIcon: Icon(Icons.search),
              hintText: AppStrings.search.tr(),
            ),
            Expanded(
              child: BlocBuilder<SearchMovieCubit, SearchMovieState>(
                bloc: searchMovieCubit,
                builder: (context, state) {
                  if (state is SearchMovieInitialState) {
                    return CustomMovieSearchIsEmpty();
                  } else if (state is SearchMovieLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is SearchMovieFailureState) {
                    return Center(
                      child: Text(
                        state.failure.failureMessage,
                        style: AppStyles.w400S20White,
                      ),
                    );
                  } else if (state is SearchMovieSuccessState) {
                    if (state.listMovieResponseEntity.movies.isEmpty) {
                      return Text(
                        AppStrings.notFound.tr(),
                        style: AppStyles.w400S20White,
                      );
                    }
                    return CustomMovieIsNotEmpty(
                      listMovieResponseEntity: state.listMovieResponseEntity,
                    );
                  }
                  return Text('Search is empty', style: AppStyles.w400S20White);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomMovieIsNotEmpty extends StatelessWidget {
  final ListMovieResponseEntity listMovieResponseEntity;
  const CustomMovieIsNotEmpty({
    super.key,
    required this.listMovieResponseEntity,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: listMovieResponseEntity.movies.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 8.h,
        childAspectRatio: 191 / 279.r,
      ),
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.movieDetailsViews,
                    arguments: listMovieResponseEntity.movies[index].id
                        .toString(),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(20.r),
                  child: CachedNetworkImage(
                    imageUrl:
                        listMovieResponseEntity.movies[index].mediumCoverImage,
                    errorWidget: (context, url, error) => const Icon(
                      Icons.broken_image,
                      size: 40,
                      color: AppColors.grey,
                    ),
                    fit: BoxFit.cover,
                  ),
                  // child: Image.asset(
                  //   AppAssets.onBoarding2,
                  //   fit: BoxFit.fill,
                  // ),
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
                      // '7.7',
                      listMovieResponseEntity.movies[index].rating.toString(),
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

class CustomMovieSearchIsEmpty extends StatelessWidget {
  const CustomMovieSearchIsEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 300.h),
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
