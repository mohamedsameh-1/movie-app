import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/feature/home/searchtab/domian/usecase/search_movie_use_case.dart';
import 'package:movie_app/feature/home/searchtab/ui/view_model/search_movie_state.dart';

@injectable
class SearchMovieCubit extends Cubit<SearchMovieState> {
  final SearchMovieUseCase searchMovieUseCase;
  SearchMovieCubit(this.searchMovieUseCase) : super(SearchMovieInitialState());

  void getListMovie(String movieTitle) async {
    emit(SearchMovieLoadingState());
    var either = await searchMovieUseCase.excute(movieTitle);
    either.fold((error) => emit(SearchMovieFailureState(failure: error)), (
      success,
    ) {
      emit(SearchMovieSuccessState(listMovieResponseEntity: success));
    });
  }

  void clearSearch() {
    emit(SearchMovieInitialState());
  }
}
