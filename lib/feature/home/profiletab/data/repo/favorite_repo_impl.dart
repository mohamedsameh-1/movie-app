import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/home/profiletab/data/datasource/remote/favorite_movie/favorite_movie_data_source.dart';
import 'package:movie_app/feature/home/profiletab/domain/entities/favorite_movie_entity.dart';
import 'package:movie_app/feature/home/profiletab/domain/entities/remove_movie_entity.dart';
import 'package:movie_app/feature/home/profiletab/domain/repo/favorite_repo.dart';

@Injectable(as: FavoriteRepo)
class FavoriteRepoImpl implements FavoriteRepo {
  final FavoriteMovieDataSource favoriteMovieDataSource;
  FavoriteRepoImpl({required this.favoriteMovieDataSource});
  @override
  Future<Either<Failure, AddFavoriteResponseEntity>> addToFavorite(
    String movieId,
    String name,
    double rating,
    String imageURL,
    String year,
  ) async {
    return favoriteMovieDataSource.addToFavorite(
      movieId,
      name,
      rating,
      imageURL,
      year,
    );
  }

  @override
  Future<Either<Failure, GetFavoriteMoviesResponseEntity>> getFavoriteMovies() {
    return favoriteMovieDataSource.getFavoriteMovies();
  }

  @override
  Future<Either<Failure, RemoveFavoriteEntity>> removeFavorite(String movieId) {
    return favoriteMovieDataSource.removeFavoriteMovies(movieId);
  }
}
