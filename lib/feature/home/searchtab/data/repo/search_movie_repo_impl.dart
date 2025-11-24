import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/home/hometab/domain/entities/list_movie_entity.dart';
import 'package:movie_app/feature/home/searchtab/data/datasource/remote/search_movie_data_source.dart';
import 'package:movie_app/feature/home/searchtab/domian/repo/search_movie_repo.dart';

@Injectable(as: SearchMovieRepo)
class SearchMovieRepoImpl implements SearchMovieRepo {
  final SearchMovieDataSource searchMovieDataSource;
  SearchMovieRepoImpl({required this.searchMovieDataSource});
  @override
  Future<Either<Failure, ListMovieResponseEntity>> searchMovieByTitle(
    String movieTitle,
  ) {
    return searchMovieDataSource.searchMovieByTitle(movieTitle);
  }
}
