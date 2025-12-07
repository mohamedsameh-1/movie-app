import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/feature/home/profiletab/domain/usecase/delete_account_use_case.dart';
import 'package:movie_app/feature/home/profiletab/ui/viewmodel/delete_account/delete_account_state.dart';

@injectable
class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  final DeleteAccountUseCase deleteAccountUseCase;
  DeleteAccountCubit(this.deleteAccountUseCase)
    : super(DeleteAccountInitialState());

  void deleteAccount() async {
    emit(DeleteAccountLoadingState());
    var either = await deleteAccountUseCase.excute();
    either.fold((error) => emit(DeleteAccountFailureState(failure: error)), (
      success,
    ) {
      emit(DeleteAccountSuccessState(deleteAccountEntity: success));
    });
  }
}
