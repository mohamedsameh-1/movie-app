import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/home/movie_details/domain/entity/movie_details_entity.dart';

abstract class MovieDetailsState {
  get movieDetailsResponseEntity => null;
}

class MovieDetailsInitialState extends MovieDetailsState {}

class MovieDetailsLoadingState extends MovieDetailsState {}

class MovieDetailsFavoriteToggledState extends MovieDetailsState {
  final bool isFav;
  MovieDetailsFavoriteToggledState(this.isFav);
}

class MovieDetailsSuccessState extends MovieDetailsState {
  @override
  final MovieDetailsResponseEntity movieDetailsResponseEntity;
  MovieDetailsSuccessState({required this.movieDetailsResponseEntity});
}
// class MovieDetailsSuccessState extends MovieDetailsState {
//   final MovieDetailsResponseEntity movieDetailsResponseEntity;
//   final bool isFav;

//   MovieDetailsSuccessState({
//     required this.movieDetailsResponseEntity,
//     required this.isFav,
//   });
// }

class MovieDetailsFailureState extends MovieDetailsState {
  final Failure failure;
  MovieDetailsFailureState({required this.failure});
}
