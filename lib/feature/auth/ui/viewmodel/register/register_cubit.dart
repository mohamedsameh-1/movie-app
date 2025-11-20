import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/utils/app_assets.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/core/utils/shared_prefrence.dart';
import 'package:movie_app/feature/auth/domain/usecase/log_in_use_case.dart';
import 'package:movie_app/feature/auth/domain/usecase/register_use_case.dart';
import 'package:movie_app/feature/auth/ui/viewmodel/register/register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;
  final LogInUseCase logInUseCase;
  RegisterCubit(this.registerUseCase, this.logInUseCase)
    : super(RegisterInitialState());

  ///hold data , handle logic
  //hold data
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController? nameController = TextEditingController(
    text: 'mohamed ',
  );
  TextEditingController? emailController = TextEditingController(
    text: 'mohamedalshaib1@gmail.com',
  );
  TextEditingController? passwordController = TextEditingController(
    text: 'mohamedalshaib1@M',
  );
  TextEditingController? confirmPasswordtroller = TextEditingController(
    text: 'mohamedalshaib1@M',
  );
  TextEditingController? phoneController = TextEditingController(
    text: '+201141209334',
  );
  bool isPassVisibilityOff = true;
  bool isCnfirmPassVisibilityOff = true;
  //avatar
  int selectedAvatarIndex = 0;
  final List<String> avatars = [
    AppAssets.avatar1Image,
    AppAssets.avatar2Image,
    AppAssets.avatar3Image,
    // AppAssets.avatar4Image,
    AppAssets.avatar5Image,
    AppAssets.avatar6Image,
    // AppAssets.avatar7Image,
    AppAssets.avatar8Image,
    AppAssets.avatar9Image,
  ];

  //handle logic
  void register() async {
    if (formKey.currentState!.validate() == true) {
      emit(RegisterLoadingState());
      var either = await registerUseCase.excute(
        nameController!.text.trim(),
        emailController!.text.trim(),
        passwordController!.text.trim(),
        confirmPasswordtroller!.text.trim(),
        phoneController!.text.trim(),
        selectedAvatarIndex,
      );

      either.fold((error) => emit(RegisterFailureState(failure: error)), (
        response,
      ) {
        print(response);
        emit(RegisterSuccessState(registerResponseEntity: response));
      });

      ///to save token , because register ont has token in api
      ///so we use this step to save token in register
      var logginEither = await logInUseCase.excute(
        emailController!.text,
        passwordController!.text,
      );
      logginEither.fold((l) => 'error in loggin Either', (r) {
        SharedPreference.saveData(
          key: AppStrings.tokenOfLoggedInOrCreatedAccount,
          value: r.token,
        );
        print('save token in register successfully');
      });
    }
  }

  void changeAvatar(int index) {
    print(selectedAvatarIndex);
    selectedAvatarIndex = index;
    emit(RegisterChangeAvatarIndexState());
  }

  void changePassVisibility() {
    isPassVisibilityOff = !isPassVisibilityOff;
    emit(RegisterChangePassVisibilityOffState());
  }

  void changeConfirmPassVisibility() {
    isCnfirmPassVisibilityOff = !isCnfirmPassVisibilityOff;
    emit(RegisterChangeConfirmPassVisibilityOffState());
  }
}
