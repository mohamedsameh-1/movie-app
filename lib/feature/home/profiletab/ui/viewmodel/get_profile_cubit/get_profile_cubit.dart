import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/feature/home/profiletab/domain/usecase/get_profile_use_case.dart';
import 'package:movie_app/feature/home/profiletab/ui/viewmodel/get_profile_cubit/get_profile_state.dart';

@injectable
class GetProfileCubit extends Cubit<GetProfileState> {
  final GetProfileUseCase getProfileUseCase;
  GetProfileCubit(this.getProfileUseCase) : super(GetProfileInitialState());

  void getProfile() async {
    emit(GetProfileLoadingState());
    var either = await getProfileUseCase.excute();
    either.fold((error) => emit(GetProfileFailureState(failure: error)), (
      success,
    ) {
      emit(GetProfileSuccessState(getProfileResponseEntity: success));
    });
  }
}
