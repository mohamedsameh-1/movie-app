import 'package:dartz/dartz.dart';
import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/home/profiletab/domain/entities/delete_account_entity.dart';
import 'package:movie_app/feature/home/profiletab/domain/entities/get_profile_entity.dart';
import 'package:movie_app/feature/home/profiletab/domain/entities/history_entity.dart';

abstract class ProfileRepo {
  Future<Either<Failure, GetProfileResponseEntity>> getProfile();
  Future<Either<Failure, DeleteAccountEntity>> deleteAccount();
  // Future<Either<Failure, HistoryMovieEntity>> saveHistory(
  //   HistoryMovieEntity historyMovie,
  // );
  // Future<Either<Failure, List<HistoryMovieEntity>>> getHistory();
}
