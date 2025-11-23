import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/home/hometab/data/datasource/remote/home_tab_remote_data_source.dart';
import 'package:movie_app/feature/home/hometab/domain/entities/list_movie_entity.dart';
import 'package:movie_app/feature/home/hometab/domain/repo/home_tab_repo.dart';

@Injectable(as: HomeTabRepo)
class HomeTabRepoImpl implements HomeTabRepo {
  final HomeTabRemoteDataSource homeTabRemoteDataSource;
  HomeTabRepoImpl({required this.homeTabRemoteDataSource});
  @override
  Future<Either<Failure, ListMovieResponseEntity>> getListMovie() {
    return homeTabRemoteDataSource.getListMovie();
  }
}
