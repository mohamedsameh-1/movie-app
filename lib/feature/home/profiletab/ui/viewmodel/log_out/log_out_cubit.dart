import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/core/utils/shared_prefrence.dart';
import 'package:movie_app/feature/home/profiletab/ui/viewmodel/log_out/log_out_state.dart';

class LogOutCubit extends Cubit<LogOutState> {
  LogOutCubit() : super(LogOutInitialState());

  void logOut() {
    emit(LogOutLoadingState());
    SharedPreference.remove(AppStrings.tokenOfLoggedInOrCreatedAccount);
    emit(LogOutSuccessState());
  }
}
