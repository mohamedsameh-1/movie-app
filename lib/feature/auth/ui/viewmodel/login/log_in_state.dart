import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/auth/domain/entities/log_in_entity.dart';

abstract class LogInState {}

class LogInInitailState extends LogInState {}

class LogInLoadingState extends LogInState {}

class LogInSuccessState extends LogInState {
  final LoginEntity loginEntity;
  LogInSuccessState({required this.loginEntity});
}

class LogInFailureState extends LogInState {
  final Failure failure;
  LogInFailureState({required this.failure});
}

class LoginChangePassVisibilityOffState extends LogInState {}
