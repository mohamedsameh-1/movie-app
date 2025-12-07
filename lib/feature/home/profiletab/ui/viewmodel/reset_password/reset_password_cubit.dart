import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/feature/home/profiletab/domain/usecase/reset_password_use_case.dart';
import 'package:movie_app/feature/home/profiletab/ui/viewmodel/reset_password/reset_password_state.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordUseCase resetPasswordUseCase;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController? oldPassController = TextEditingController();
  TextEditingController? newPassController = TextEditingController();
  ResetPasswordCubit(this.resetPasswordUseCase)
    : super(ResetPasswordInitialState());

  void resetPassword() async {
    if (formKey.currentState!.validate() == true) {
      emit(ResetPasswordLoadingState());
      var either = await resetPasswordUseCase.excute(
        oldPassController!.text,
        newPassController!.text,
      );
      either.fold((error) => emit(ResetPasswordFailureState(failure: error)), (
        success,
      ) {
        emit(ResetPasswordSuccessState(resetPasswordResponseEntity: success));
      });
    }
  }

  bool isOldPasswordVisibilityOff = true;
  void changeVisibilityOldPassword() {
    isOldPasswordVisibilityOff = !isOldPasswordVisibilityOff;
    emit(ResetPasswordChangeVisibitlityOldPasswordState());
  }

  bool isNewPasswordVisibilityOff = true;
  void changeVisibilityNewPassword() {
    isNewPasswordVisibilityOff = !isNewPasswordVisibilityOff;
    emit(ResetPasswordChangeVisibitlityNewPasswordState());
  }
}
