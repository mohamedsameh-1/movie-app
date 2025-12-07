import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/feature/home/profiletab/domain/usecase/remove_movie_use_case.dart';
import 'package:movie_app/feature/home/profiletab/ui/viewmodel/remove_favorite_movie/remove_favorite_movie_state.dart';

@injectable
class RemoveFavoriteMovieCubit extends Cubit<RemoveFavoriteState> {
  final RemoveFavoriteUseCase removeFavoriteUseCase;
  RemoveFavoriteMovieCubit(this.removeFavoriteUseCase)
    : super(RemoveFavoriteInitial());

  void removeFavoriteMovieId(String movieId) async {
    emit(RemoveFavoriteLoading());
    var either = await removeFavoriteUseCase.call(movieId);
    either.fold(
      (error) => emit(RemoveFavoriteError(failure: error)),
      (success) => emit(RemoveFavoriteSuccess(removeFavoriteEntity: success)),
    );
  }
}
