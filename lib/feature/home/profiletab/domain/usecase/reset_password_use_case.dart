import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/home/profiletab/domain/entities/reset_password_entity.dart';
import 'package:movie_app/feature/home/profiletab/domain/repo/reset_password_repo.dart';

@injectable
class ResetPasswordUseCase {
  final ResetPasswordRepo resetPasswordRepo;
  ResetPasswordUseCase({required this.resetPasswordRepo});

  Future<Either<Failure, ResetPasswordResponseEntity>> excute(
    String oldPassword,
    String newPassword,
  ) {
    return resetPasswordRepo.resetPassword(oldPassword, newPassword);
  }
}
