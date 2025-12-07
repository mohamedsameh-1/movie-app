import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/home/profiletab/domain/entities/delete_account_entity.dart';

abstract class DeleteAccountState {}

class DeleteAccountInitialState extends DeleteAccountState {}

class DeleteAccountLoadingState extends DeleteAccountState {}

class DeleteAccountFailureState extends DeleteAccountState {
  final Failure failure;
  DeleteAccountFailureState({required this.failure});
}

class DeleteAccountSuccessState extends DeleteAccountState {
  final DeleteAccountEntity deleteAccountEntity;
  DeleteAccountSuccessState({required this.deleteAccountEntity});
}
