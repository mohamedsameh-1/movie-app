import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/home/profiletab/domain/entities/get_profile_entity.dart';

abstract class GetProfileState {}

class GetProfileInitialState extends GetProfileState {}

class GetProfileLoadingState extends GetProfileState {}

class GetProfileFailureState extends GetProfileState {
  final Failure failure;
  GetProfileFailureState({required this.failure});
}

class GetProfileSuccessState extends GetProfileState {
  final GetProfileResponseEntity getProfileResponseEntity;
  GetProfileSuccessState({required this.getProfileResponseEntity});
}
