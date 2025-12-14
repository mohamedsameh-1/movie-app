import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/home/profiletab/domain/entities/remove_movie_entity.dart';
import 'package:movie_app/feature/home/profiletab/domain/repo/favorite_repo.dart';

@injectable
class RemoveFavoriteUseCase {
  final FavoriteRepo repo;

  RemoveFavoriteUseCase(this.repo);

  Future<Either<Failure, RemoveFavoriteEntity>> excute(String movieId) async {
    return await repo.removeFavorite(movieId);
  }
}
