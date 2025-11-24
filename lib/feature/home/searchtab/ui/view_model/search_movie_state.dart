import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/home/hometab/domain/entities/list_movie_entity.dart';

abstract class SearchMovieState {}

class SearchMovieInitialState extends SearchMovieState {}

class SearchMovieLoadingState extends SearchMovieState {}

class SearchMovieFailureState extends SearchMovieState {
  final Failure failure;
  SearchMovieFailureState({required this.failure});
}

class SearchMovieSuccessState extends SearchMovieState {
  final ListMovieResponseEntity listMovieResponseEntity;
  SearchMovieSuccessState({required this.listMovieResponseEntity});
}
