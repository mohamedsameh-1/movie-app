import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/feature/home/profiletab/ui/viewmodel/get_favorite_movie/get_favorite_movie_cubit.dart';
import 'package:movie_app/feature/home/profiletab/ui/viewmodel/get_favorite_movie/get_favorite_movie_state.dart';
import 'package:movie_app/feature/home/profiletab/ui/viewmodel/get_profile_cubit/get_profile_cubit.dart';
import 'package:movie_app/feature/home/profiletab/ui/viewmodel/get_profile_cubit/get_profile_state.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder<GetProfileCubit, GetProfileState>(
          builder: (context, state) {
            if (state is GetProfileLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is GetProfileSuccessState) {
              return Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(118.r),
                    child: Image.asset(
                      AppStrings.avatars[state
                              .getProfileResponseEntity
                              .data
                              .avaterId -
                          1],
                      height: 118.h,
                      width: 118.w,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: 113.w,
                    child: Text(
                      state.getProfileResponseEntity.data.name,
                      style: AppStyles.w700S20Wite,
                      softWrap: true,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              );
            } else if (state is GetProfileFailureState) {
              return Text(
                state.failure.failureMessage,
                style: AppStyles.w400S14White,
              );
            }
            return Center(child: Text('oops', style: AppStyles.w400S16White));
          },
        ),
        BlocBuilder<GetFavoriteMoviesCubit, GetFavoriteMoviesState>(
          builder: (context, state) {
            if (state is GetFavoriteMoviesSuccess) {
              if (state.response.data.isEmpty) {
                return Column(
                  spacing: 10.h,
                  children: [
                    Text('0', style: AppStyles.w700S36White),
                    Text(AppStrings.watchList, style: AppStyles.w700S24White),
                  ],
                );
              } else {
                return Column(
                  spacing: 10.h,
                  children: [
                    Text(
                      state.response.data.length.toString(),
                      style: AppStyles.w700S36White,
                    ),
                    Text(AppStrings.watchList, style: AppStyles.w700S24White),
                  ],
                );
              }
            }
            return Text('00');
          },
        ),
        // Column(
        //   spacing: 10.h,
        //   children: [
        //     Text('10', style: AppStyles.w700S36White),
        //     Text(AppStrings.history, style: AppStyles.w700S24White),
        //   ],
        // ),
      ],
    );
  }
}
