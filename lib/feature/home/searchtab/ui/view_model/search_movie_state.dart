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
  final List<MovieEntity> movies;
  final bool isLoadingMore;
  SearchMovieSuccessState({required this.movies, required this.isLoadingMore});
}

class PaginatSearchMovieLoadingState extends SearchMovieState {
  final bool isLoadingMore;
  PaginatSearchMovieLoadingState({required this.isLoadingMore});
}
