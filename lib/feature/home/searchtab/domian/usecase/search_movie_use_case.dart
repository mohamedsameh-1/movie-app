import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/home/hometab/domain/entities/list_movie_entity.dart';
import 'package:movie_app/feature/home/searchtab/domian/repo/search_movie_repo.dart';

@injectable
class SearchMovieUseCase {
  final SearchMovieRepo searchMovieRepo;
  SearchMovieUseCase({required this.searchMovieRepo});
  Future<Either<Failure, ListMovieResponseEntity>> excute(
    String movieTitle,
    int page,
  ) {
    return searchMovieRepo.searchMovieByTitle(movieTitle, page);
  }
}
