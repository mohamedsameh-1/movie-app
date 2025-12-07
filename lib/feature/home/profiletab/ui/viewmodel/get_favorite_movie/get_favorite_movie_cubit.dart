import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/feature/home/profiletab/domain/usecase/get_all_favorite_use_case.dart';
import 'package:movie_app/feature/home/profiletab/ui/viewmodel/get_favorite_movie/get_favorite_movie_state.dart';

@injectable
class GetFavoriteMoviesCubit extends Cubit<GetFavoriteMoviesState> {
  final GetFavoriteMoviesUseCase useCase;
  List<String> favoritesIds = [];

  GetFavoriteMoviesCubit(this.useCase) : super(GetFavoriteMoviesInitial());

  Future<void> getFavorites() async {
    emit(GetFavoriteMoviesLoading());
    var eihter = await useCase.excute();
    eihter.fold((error) => emit(GetFavoriteMoviesError(failure: error)), (
      success,
    ) {
      favoritesIds = success.data
          .map((movie) => movie.movieId.toString())
          .toList();

      emit(GetFavoriteMoviesSuccess(success));
    });
  }
}
