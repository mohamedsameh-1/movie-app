import 'package:dartz/dartz.dart';
import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/home/hometab/domain/entities/list_movie_entity.dart';

abstract class SearchMovieRepo {
  Future<Either<Failure, ListMovieResponseEntity>> searchMovieByTitle(
    String movieTitle,
    int page,
  );
}
