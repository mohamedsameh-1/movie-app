import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/feature/home/movie_details/domain/usecase/movie_suggestion_use_case.dart';
import 'package:movie_app/feature/home/movie_details/ui/viewmodel/movie_suggestion/movie_suggestion_state.dart';

@injectable
class MovieSuggestionCubit extends Cubit<MovieSuggestionState> {
  final MovieSuggestionUseCase movieSuggestionUseCase;
  MovieSuggestionCubit(this.movieSuggestionUseCase)
    : super(MovieSuggestionInitialState());
  void getMovieSuggestion(String movieId) async {
    emit(MovieSuggestionLoadingState());
    var either = await movieSuggestionUseCase.excute(movieId);
    either.fold((error) => emit(MovieSuggestionFailureState(failure: error)), (
      success,
    ) {
      emit(MovieSuggestionSuccessState(movieSuggestionResponseEntity: success));
    });
  }
}
