import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/home/movie_details/domain/entity/movie_details_entity.dart';

abstract class MovieDetailsState {}

class MovieDetailsInitialState extends MovieDetailsState {}

class MovieDetailsLoadingState extends MovieDetailsState {}

class MovieDetailsSuccessState extends MovieDetailsState {
  final MovieDetailsResponseEntity movieDetailsResponseEntity;
  MovieDetailsSuccessState({required this.movieDetailsResponseEntity});
}

class MovieDetailsFailureState extends MovieDetailsState {
  final Failure failure;
  MovieDetailsFailureState({required this.failure});
}
