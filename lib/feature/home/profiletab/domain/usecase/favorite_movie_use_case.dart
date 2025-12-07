import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/home/profiletab/domain/entities/favorite_movie_entity.dart';
import 'package:movie_app/feature/home/profiletab/domain/repo/favorite_repo.dart';

@injectable
class AddFavoriteUseCase {
  final FavoriteRepo favoriteRepo;

  AddFavoriteUseCase(this.favoriteRepo);

  Future<Either<Failure, AddFavoriteResponseEntity>> execute(
    String movieId,
    String name,
    double rating,
    String imageURL,
    String year,
  ) async {
    return await favoriteRepo.addToFavorite(
      movieId,
      name,
      rating,
      imageURL,
      year,
    );
  }
}
