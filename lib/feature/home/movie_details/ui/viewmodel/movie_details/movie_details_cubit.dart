import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/feature/home/movie_details/domain/usecase/movie_details_use_case.dart';
import 'package:movie_app/feature/home/movie_details/ui/viewmodel/movie_details/movie_details_state.dart';

@injectable
class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final MovieDetailsUseCase movieDetailsUseCase;
  // final String movieId;
  bool isFav = false;
  MovieDetailsCubit(this.movieDetailsUseCase)
    : super(MovieDetailsInitialState());

  void getMovieDetailsById(String movieId) async {
    emit(MovieDetailsLoadingState());
    var either = await movieDetailsUseCase.excute(movieId);
    either.fold((error) => emit(MovieDetailsFailureState(failure: error)), (
      success,
    ) {
      // movieId=  success.movie.id.toString();
      emit(MovieDetailsSuccessState(movieDetailsResponseEntity: success));
    });
  }
}
