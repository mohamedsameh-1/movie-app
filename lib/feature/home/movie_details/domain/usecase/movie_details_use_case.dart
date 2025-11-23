import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/home/movie_details/domain/entity/movie_details_entity.dart';
import 'package:movie_app/feature/home/movie_details/domain/repo/movie_details_repo.dart';

@injectable
class MovieDetailsUseCase {
  final MovieDetailsRepo movieDetailsRepo;
  MovieDetailsUseCase({required this.movieDetailsRepo});
  Future<Either<Failure, MovieDetailsResponseEntity>> excute(String movieId) {
    return movieDetailsRepo.getMovieDetails(movieId);
  }
}
