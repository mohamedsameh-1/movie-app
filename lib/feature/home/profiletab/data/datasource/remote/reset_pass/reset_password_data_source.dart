import 'package:dartz/dartz.dart';
import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/home/profiletab/domain/entities/reset_password_entity.dart';

abstract class ResetPasswordDataSource {
  Future<Either<Failure, ResetPasswordResponseEntity>> restPassword(
    String oldPassword,
    String newPassword,
  );
}
