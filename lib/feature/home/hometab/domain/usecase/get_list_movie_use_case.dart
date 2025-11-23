import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/home/hometab/domain/entities/list_movie_entity.dart';
import 'package:movie_app/feature/home/hometab/domain/repo/home_tab_repo.dart';

@injectable
class GetListMovieUseCase {
  final HomeTabRepo homeTabRepo;
  GetListMovieUseCase({required this.homeTabRepo});
  Future<Either<Failure, ListMovieResponseEntity>> excute() {
    return homeTabRepo.getListMovie();
  }
}
