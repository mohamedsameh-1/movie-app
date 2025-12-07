import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/home/profiletab/data/datasource/remote/profile/profile_remote_data_source.dart';
import 'package:movie_app/feature/home/profiletab/domain/entities/delete_account_entity.dart';
import 'package:movie_app/feature/home/profiletab/domain/entities/get_profile_entity.dart';
import 'package:movie_app/feature/home/profiletab/domain/repo/profile_repo.dart';

@Injectable(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  final ProfileRemoteDataSource profileRemoteDataSource;
  // final ProfileLocalDataSource profileLocalDataSource;
  ProfileRepoImpl({required this.profileRemoteDataSource});
  @override
  Future<Either<Failure, GetProfileResponseEntity>> getProfile() {
    return profileRemoteDataSource.getProfile();
  }

  @override
  Future<Either<Failure, DeleteAccountEntity>> deleteAccount() {
    return profileRemoteDataSource.deleteAccount();
  }
}

//   @override
//   Future<Either<Failure, List<HistoryMovieEntity>>> getHistory() {
//     return profileLocalDataSource.getHistory();
//   }

//   @override
//   Future<Either<Failure, HistoryMovieEntity>> saveHistory(
//     HistoryMovieEntity historyMovie,
//   ) {
//     return profileLocalDataSource.saveHistory(historyMovie);
//   }
// }
