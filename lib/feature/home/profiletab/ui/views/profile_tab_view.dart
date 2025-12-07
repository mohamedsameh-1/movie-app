import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/di/di.dart';
import 'package:movie_app/feature/home/profiletab/ui/viewmodel/get_favorite_movie/get_favorite_movie_cubit.dart';
import 'package:movie_app/feature/home/profiletab/ui/viewmodel/get_profile_cubit/get_profile_cubit.dart';

import 'package:movie_app/feature/home/profiletab/ui/views/widgets/profile_buttons.dart';
import 'package:movie_app/feature/home/profiletab/ui/views/widgets/profile_header.dart';
import 'package:movie_app/feature/home/profiletab/ui/views/widgets/profile_tabs.dart';

class ProfileTabView extends StatelessWidget {
  const ProfileTabView({super.key});

  @override
  Widget build(BuildContext context) {
    GetProfileCubit getProfileCubit = getIt<GetProfileCubit>();
    GetFavoriteMoviesCubit getFavoriteMoviesCubit =
        getIt<GetFavoriteMoviesCubit>();
    return BlocProvider(
      create: (context) => getProfileCubit..getProfile(),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          child: BlocProvider(
            create: (context) => getFavoriteMoviesCubit..getFavorites(),
            child: Column(
              children: [
                /// 1
                ProfileHeader(),
                SizedBox(height: 30.h),

                /// 2
                ProfileButtons(),
                SizedBox(height: 30.h),

                ///3
                ProfileTabs(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
