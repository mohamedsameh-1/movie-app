import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/di/di.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/feature/home/movie_details/ui/viewmodel/movie_suggestion/movie_suggestion_cubit.dart';
import 'package:movie_app/feature/home/movie_details/ui/viewmodel/movie_suggestion/movie_suggestion_state.dart';

class MovieSuggestion extends StatelessWidget {
  const MovieSuggestion({super.key});

  @override
  Widget build(BuildContext context) {
    MovieSuggestionCubit movieSuggestionCubit = getIt<MovieSuggestionCubit>();
    final movieIdArgument =
        ModalRoute.of(context)!.settings.arguments as String;

    return BlocBuilder<MovieSuggestionCubit, MovieSuggestionState>(
      bloc: movieSuggestionCubit..getMovieSuggestion(movieIdArgument),
      builder: (context, state) {
        if (state is MovieSuggestionFailureState) {
          return Center(child: Text(state.failure.failureMessage));
        } else if (state is MovieSuggestionLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is MovieSuggestionSuccessState) {
          return SizedBox(
            height: 480.h,
            child: GridView.builder(
              itemCount: state.movieSuggestionResponseEntity.movies.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20.w,
                mainAxisSpacing: 16.h,
                childAspectRatio: 189 / 279.r,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.movieDetailsViews,
                      arguments: state
                          .movieSuggestionResponseEntity
                          .movies[index]
                          .id
                          .toString(),
                    );
                  },
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(16.r),
                        child: CachedNetworkImage(
                          imageUrl: state
                              .movieSuggestionResponseEntity
                              .movies[index]
                              .mediumCoverImage,
                          fit: BoxFit.fill,
                          errorWidget: (context, url, error) => const Icon(
                            Icons.broken_image,
                            size: 40,
                            color: AppColors.grey,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 8.w,
                        top: 8.h,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: AppColors.darkGreenGray,
                          ),
                          child: Row(
                            children: [
                              Text(
                                state
                                    .movieSuggestionResponseEntity
                                    .movies[index]
                                    .rating
                                    .toString(),
                                style: AppStyles.w400S16White,
                              ),
                              Icon(Icons.star, color: AppColors.yellow),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }
        return Text('oops ,Error In Similar');
      },
    );
  }
}
