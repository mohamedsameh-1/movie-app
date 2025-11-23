import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/di/di.dart';
import 'package:movie_app/feature/home/hometab/ui/viewmodel/list_movie/list_movie_cubit.dart';
import 'package:movie_app/feature/home/hometab/ui/views/widgets/home_tab_body.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({super.key});

  @override
  Widget build(BuildContext context) {
    ListMovieCubit listmovieCubit = getIt<ListMovieCubit>();
    return BlocProvider(
      create: (context) => listmovieCubit..getListMovie(),
      child: HomeTabBody(),
    );
  }
}
