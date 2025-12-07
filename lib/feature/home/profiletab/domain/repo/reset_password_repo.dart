import 'package:dartz/dartz.dart';
import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/home/profiletab/domain/entities/reset_password_entity.dart';

abstract class ResetPasswordRepo {
  Future<Either<Failure, ResetPasswordResponseEntity>> resetPassword(
    String oldPassword,
    String newPassword,
  );
}
