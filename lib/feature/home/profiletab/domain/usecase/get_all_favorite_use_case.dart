import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/home/profiletab/domain/entities/add_favorite_movie_entity.dart';
import 'package:movie_app/feature/home/profiletab/domain/repo/favorite_repo.dart';

@injectable
class GetFavoriteMoviesUseCase {
  final FavoriteRepo repository;

  GetFavoriteMoviesUseCase(this.repository);

  Future<Either<Failure, GetFavoriteMoviesResponseEntity>> excute() {
    return repository.getFavoriteMovies();
  }
}
