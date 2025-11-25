import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/home/hometab/domain/entities/list_movie_entity.dart';

abstract class BrowseState {}

class BrowseInitialState extends BrowseState {}

class BrowseLoadingState extends BrowseState {}

class BrowseFailureState extends BrowseState {
  final Failure failure;
  BrowseFailureState({required this.failure});
}

class BrowseSuccessState extends BrowseState {
  final ListMovieResponseEntity listMovieResponseEntity;
  BrowseSuccessState({required this.listMovieResponseEntity});
}
