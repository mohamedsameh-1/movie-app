import 'package:dartz/dartz.dart';
import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/home/profiletab/domain/entities/add_favorite_movie_entity.dart';
import 'package:movie_app/feature/home/profiletab/domain/entities/remove_movie_entity.dart';

abstract class FavoriteMovieDataSource {
  Future<Either<Failure, AddFavoriteResponseEntity>> addToFavorite(
    String movieId,
    String name,
    double rating,
    String imageURL,
    String year,
  );
  Future<Either<Failure, GetFavoriteMoviesResponseEntity>> getFavoriteMovies();
  Future<Either<Failure, RemoveFavoriteEntity>> removeFavoriteMovies(
    String movieId,
  );
}
