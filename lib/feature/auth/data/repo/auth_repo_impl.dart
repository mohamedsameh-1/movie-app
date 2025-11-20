import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/auth/data/datasources/contract/auth_data_source.dart';
import 'package:movie_app/feature/auth/domain/entities/log_in_entity.dart';
import 'package:movie_app/feature/auth/domain/entities/register_entity.dart';
import 'package:movie_app/feature/auth/domain/repo/auth_repo.dart';

@Injectable(as: AuthrRepo)
class AuthRepoImpl implements AuthrRepo {
  final AuthDataSource authDataSource;
  AuthRepoImpl({required this.authDataSource});
  @override
  Future<Either<Failure, RegisterResponseEntity>> register(
    String name,
    String email,
    String password,
    String confirmPassword,
    String phone,
    int avatarId,
  ) {
    return authDataSource.register(
      name,
      email,
      password,
      confirmPassword,
      phone,
      avatarId,
    );
  }

  @override
  Future<Either<Failure, LoginEntity>> logIn(String email, String password) {
    return authDataSource.logIn(email, password);
  }
}
