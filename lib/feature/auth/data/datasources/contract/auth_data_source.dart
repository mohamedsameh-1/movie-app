import 'package:dartz/dartz.dart';
import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/auth/domain/entities/log_in_entity.dart';
import 'package:movie_app/feature/auth/domain/entities/register_entity.dart';

abstract class AuthDataSource {
  Future<Either<Failure, RegisterResponseEntity>> register(
    String name,
    String email,
    String password,
    String confirmPassword,
    String phone,
    int avatarId,
  );
  Future<Either<Failure, LoginEntity>> logIn(String email, String password);
}
