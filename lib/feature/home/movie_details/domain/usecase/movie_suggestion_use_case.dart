import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/home/movie_details/domain/entity/movie_suggestion_entity.dart';
import 'package:movie_app/feature/home/movie_details/domain/repo/movie_details_repo.dart';

@injectable
class MovieSuggestionUseCase {
  final MovieDetailsRepo movieDetailsRepo;
  MovieSuggestionUseCase({required this.movieDetailsRepo});
  Future<Either<Failure, MovieSuggestionResponseEntity>> excute(
    String movieId,
  ) {
    return movieDetailsRepo.getMovieSuggestion(movieId);
  }
}
