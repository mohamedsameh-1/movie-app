import 'package:dartz/dartz.dart';
import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/home/movie_details/domain/entity/movie_details_entity.dart';
import 'package:movie_app/feature/home/movie_details/domain/entity/movie_suggestion_entity.dart';

abstract class MovieDetailsRepo {
  Future<Either<Failure, MovieDetailsResponseEntity>> getMovieDetails(
    String movieId,
  );
  Future<Either<Failure, MovieSuggestionResponseEntity>> getMovieSuggestion(
    String movieId,
  );
}
