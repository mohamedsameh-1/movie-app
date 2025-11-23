import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/home/movie_details/data/datasources/remote/movie_details_remote_data_source.dart';
import 'package:movie_app/feature/home/movie_details/domain/entity/movie_details_entity.dart';
import 'package:movie_app/feature/home/movie_details/domain/entity/movie_suggestion_entity.dart';
import 'package:movie_app/feature/home/movie_details/domain/repo/movie_details_repo.dart';

@Injectable(as: MovieDetailsRepo)
class MovieDetailsRepoImpl implements MovieDetailsRepo {
  final MovieDetailsRemoteDataSource movieDetailsRemoteDataSource;
  MovieDetailsRepoImpl({required this.movieDetailsRemoteDataSource});
  @override
  Future<Either<Failure, MovieDetailsResponseEntity>> getMovieDetails(
    String movieId,
  ) {
    return movieDetailsRemoteDataSource.getMovieDetails(movieId);
  }

  @override
  Future<Either<Failure, MovieSuggestionResponseEntity>> getMovieSuggestion(
    String movieId,
  ) {
    return movieDetailsRemoteDataSource.getMovieSuggestion(movieId);
  }
}
