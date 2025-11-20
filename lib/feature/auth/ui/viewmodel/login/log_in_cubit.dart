import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/feature/auth/domain/usecase/log_in_use_case.dart';
import 'package:movie_app/feature/auth/ui/viewmodel/login/log_in_state.dart';

@injectable
class LogInCubit extends Cubit<LogInState> {
  final LogInUseCase logInUseCase;
  LogInCubit(this.logInUseCase) : super(LogInInitailState());

  ///hold data ,  handle logic

  //hold data
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController? emailController = TextEditingController(
    text: 'mohamedalshaib1@gmail.com',
  );
  TextEditingController? passwordController = TextEditingController(
    text: 'mohamedalshaib1@M',
  );
  bool isPassVisibilityOff = true;

  //handle logic
  void login() async {
    if (formKey.currentState!.validate() == true) {
      emit(LogInLoadingState());
      var either = await logInUseCase.excute(
        emailController!.text.trim(),
        passwordController!.text.trim(),
      );

      either.fold((error) => emit(LogInFailureState(failure: error)), (
        response,
      ) {
        print(response);
        emit(LogInSuccessState(loginEntity: response));
      });
    }
  }

  void changePassVisibility() {
    isPassVisibilityOff = !isPassVisibilityOff;
    emit(LoginChangePassVisibilityOffState());
  }
}
