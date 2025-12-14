import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/feature/home/profiletab/domain/entities/add_favorite_movie_entity.dart';
import 'package:movie_app/feature/home/profiletab/domain/usecase/add_favorite_movie_use_case.dart';
import 'package:movie_app/feature/home/profiletab/domain/usecase/get_all_favorite_use_case.dart';
import 'package:movie_app/feature/home/profiletab/domain/usecase/remove_movie_use_case.dart';
import 'favorite_state.dart';

@injectable
class FavoriteCubit extends Cubit<FavouriteState> {
  FavoriteCubit(
    this.addFavoriteUseCase,
    this.removeFavoriteUseCase,
    this.getFavoriteMoviesUseCase,
  ) : super(FavouriteInitial());

  final AddFavoriteUseCase addFavoriteUseCase;
  final RemoveFavoriteUseCase removeFavoriteUseCase;
  final GetFavoriteMoviesUseCase getFavoriteMoviesUseCase;

  List<FavoriteMovieEntity> favorites = [];

  // ============================
  //      GET ALL FAVORITES
  // ============================
  Future<void> loadFavorites() async {
    emit(FavouriteLoading());

    final response = await getFavoriteMoviesUseCase.excute();

    response.fold((failure) => emit(FavouriteError(failure: failure)), (
      result,
    ) {
      favorites = result.data;
      emit(FavouriteLoaded(getFavMovie: favorites));
    });
  }

  // ============================
  //     TOGGLE FAVORITE
  // ============================
  Future<void> toggleFavorite({
    required String movieId,
    required String name,
    required double rating,
    required String imageURL,
    required String year,
  }) async {
    final bool isFav = favorites.any((m) => m.movieId == movieId);

    // ----------------- REMOVE -----------------
    if (isFav) {
      final response = await removeFavoriteUseCase.excute(movieId);

      response.fold((failure) => emit(FavouriteError(failure: failure)), (_) {
        favorites.removeWhere((m) => m.movieId == movieId);
        emit(FavouriteLoaded(getFavMovie: List.from(favorites)));
      });

      return;
    }

    // ----------------- ADD -----------------
    final response = await addFavoriteUseCase.execute(
      movieId,
      name,
      rating,
      imageURL,
      year,
    );

    response.fold((failure) => emit(FavouriteError(failure: failure)), (
      addedMovie,
    ) {
      favorites.add(addedMovie.data);
      emit(FavouriteLoaded(getFavMovie: List.from(favorites)));
    });
  }

  // ============================
  //        CHECK FAVORITE
  // ============================
  bool isFavorite(String id) {
    return favorites.any((m) => m.movieId == id);
  }
}
