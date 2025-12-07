import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/home/profiletab/domain/entities/reset_password_entity.dart';

abstract class ResetPasswordState {}

class ResetPasswordInitialState extends ResetPasswordState {}

class ResetPasswordLoadingState extends ResetPasswordState {}

class ResetPasswordFailureState extends ResetPasswordState {
  final Failure failure;
  ResetPasswordFailureState({required this.failure});
}

class ResetPasswordSuccessState extends ResetPasswordState {
  final ResetPasswordResponseEntity resetPasswordResponseEntity;
  ResetPasswordSuccessState({required this.resetPasswordResponseEntity});
}

class ResetPasswordChangeVisibitlityOldPasswordState
    extends ResetPasswordState {}

class ResetPasswordChangeVisibitlityNewPasswordState
    extends ResetPasswordState {}
