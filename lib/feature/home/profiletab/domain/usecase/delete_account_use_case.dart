import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/home/profiletab/domain/entities/delete_account_entity.dart';
import 'package:movie_app/feature/home/profiletab/domain/repo/profile_repo.dart';

@injectable
class DeleteAccountUseCase {
  final ProfileRepo profileRepo;
  DeleteAccountUseCase({required this.profileRepo});
  Future<Either<Failure, DeleteAccountEntity>> excute() {
    return profileRepo.deleteAccount();
  }
}
