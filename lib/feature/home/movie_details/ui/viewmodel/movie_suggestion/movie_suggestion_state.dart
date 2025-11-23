import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/home/movie_details/domain/entity/movie_suggestion_entity.dart';

abstract class MovieSuggestionState {}

class MovieSuggestionInitialState extends MovieSuggestionState {}

class MovieSuggestionLoadingState extends MovieSuggestionState {}

class MovieSuggestionSuccessState extends MovieSuggestionState {
  final MovieSuggestionResponseEntity movieSuggestionResponseEntity;
  MovieSuggestionSuccessState({required this.movieSuggestionResponseEntity});
}

class MovieSuggestionFailureState extends MovieSuggestionState {
  final Failure failure;
  MovieSuggestionFailureState({required this.failure});
}
