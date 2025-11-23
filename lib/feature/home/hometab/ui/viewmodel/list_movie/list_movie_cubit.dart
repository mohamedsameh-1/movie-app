import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/feature/home/hometab/domain/entities/list_movie_entity.dart';
import 'package:movie_app/feature/home/hometab/domain/usecase/get_list_movie_use_case.dart';
import 'package:movie_app/feature/home/hometab/ui/viewmodel/list_movie/list_movie_state.dart';

@injectable
class ListMovieCubit extends Cubit<ListMovieState> {
  final GetListMovieUseCase listMovieUseCase;
  List<MovieEntity> moviesItem = [];
  ListMovieCubit(this.listMovieUseCase) : super(ListMovieInitialState());

  void getListMovie() async {
    emit(ListMovieLoadingState());
    var either = await listMovieUseCase.excute();
    either.fold((error) => emit(ListMovieFailureState(failure: error)), (
      success,
    ) {
      success.movies.sort(
        (a, b) => safeParseDate(
          b.dateUploaded,
        ).compareTo(safeParseDate(a.dateUploaded)),
      );
      moviesItem = success.movies;
      print(success.movies.take(3).map((e) => e.dateUploaded));
      emit(ListMovieSuccessState(listMovieResponseEntity: success));
    });
  }
}

DateTime safeParseDate(String dateString) {
  try {
    return DateTime.parse(dateString);
  } catch (_) {
    // لو التاريخ جالك بالشكل: "22 Apr 2020" أو "2020-04-22 12:00:00"
    try {
      return DateTime.tryParse(dateString.replaceAll(" ", "T")) ??
          DateTime(1970);
    } catch (_) {
      return DateTime(1970);
    }
  }
}
