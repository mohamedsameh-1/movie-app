import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/home/profiletab/domain/entities/get_profile_entity.dart';
import 'package:movie_app/feature/home/profiletab/domain/repo/profile_repo.dart';

@injectable
class GetProfileUseCase {
  final ProfileRepo profileRepo;
  GetProfileUseCase({required this.profileRepo});

  Future<Either<Failure, GetProfileResponseEntity>> excute() {
    return profileRepo.getProfile();
  }
}
