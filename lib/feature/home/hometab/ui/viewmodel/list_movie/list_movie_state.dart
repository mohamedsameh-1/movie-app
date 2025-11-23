import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/home/hometab/domain/entities/list_movie_entity.dart';

abstract class ListMovieState {}

class ListMovieInitialState extends ListMovieState {}

class ListMovieLoadingState extends ListMovieState {}

class ListMovieSuccessState extends ListMovieState {
  final ListMovieResponseEntity listMovieResponseEntity;
  ListMovieSuccessState({required this.listMovieResponseEntity});
}

class ListMovieFailureState extends ListMovieState {
  final Failure failure;
  ListMovieFailureState({required this.failure});
}
