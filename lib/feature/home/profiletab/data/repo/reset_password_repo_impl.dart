import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/home/profiletab/data/datasource/remote/reset_pass/reset_password_data_source.dart';
import 'package:movie_app/feature/home/profiletab/domain/entities/reset_password_entity.dart';
import 'package:movie_app/feature/home/profiletab/domain/repo/reset_password_repo.dart';

@Injectable(as: ResetPasswordRepo)
class ResetPasswordRepoImpl implements ResetPasswordRepo {
  final ResetPasswordDataSource resetPasswordDataSource;
  ResetPasswordRepoImpl({required this.resetPasswordDataSource});
  @override
  Future<Either<Failure, ResetPasswordResponseEntity>> resetPassword(
    String oldPassword,
    String newPassword,
  ) {
    return resetPasswordDataSource.restPassword(oldPassword, newPassword);
  }
}
