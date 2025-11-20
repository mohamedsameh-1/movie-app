import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/auth/domain/entities/register_entity.dart';

abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterFailureState extends RegisterState {
  final Failure failure;
  RegisterFailureState({required this.failure});
}

class RegisterSuccessState extends RegisterState {
  final RegisterResponseEntity registerResponseEntity;
  RegisterSuccessState({required this.registerResponseEntity});
}

class RegisterChangeAvatarIndexState extends RegisterState {}

class RegisterChangePassVisibilityOffState extends RegisterState {}

class RegisterChangeConfirmPassVisibilityOffState extends RegisterState {}
