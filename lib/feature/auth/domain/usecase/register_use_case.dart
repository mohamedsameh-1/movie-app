import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/auth/domain/entities/register_entity.dart';
import 'package:movie_app/feature/auth/domain/repo/auth_repo.dart';

@injectable
class RegisterUseCase {
  final AuthrRepo authrRepo;
  RegisterUseCase({required this.authrRepo});
  Future<Either<Failure, RegisterResponseEntity>> excute(
    String name,
    String email,
    String password,
    String confirmPassword,
    String phone,
    int avatarId,
  ) {
    return authrRepo.register(
      name,
      email,
      password,
      confirmPassword,
      phone,
      avatarId,
    );
  }
}
