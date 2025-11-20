import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/auth/domain/entities/log_in_entity.dart';
import 'package:movie_app/feature/auth/domain/repo/auth_repo.dart';

@injectable
class LogInUseCase {
  final AuthrRepo authrRepo;
  LogInUseCase({required this.authrRepo});
  Future<Either<Failure, LoginEntity>> excute(String email, String password) {
    return authrRepo.logIn(email, password);
  }
}
