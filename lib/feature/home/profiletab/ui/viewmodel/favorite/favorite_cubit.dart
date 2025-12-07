import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/api/api_manger.dart';
import 'package:movie_app/core/api/end_points.dart';
import 'package:movie_app/feature/home/movie_details/domain/entity/movie_details_entity.dart';
import 'package:movie_app/feature/home/profiletab/ui/viewmodel/favorite/favorite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit(this.apiManger) : super(FavouriteInitial());

  bool isFavourite = false;

  Future<void> toggleFavourite(MovieDetailsEntity movie) async {
    emit(FavouriteLoading());
    try {
      if (!isFavourite) {
        await addMovieToFav(movie);
        isFavourite = true;
        emit(FavouriteAdded());
      } else {
        await removeMovieFromFav(movie.id.toString());
        isFavourite = false;
        emit(FavouriteRemoved());
      }
    } catch (e) {
      emit(FavouriteError(e.toString()));
    }
  }

  final ApiManger apiManger;
  Future<void> addMovieToFav(MovieDetailsEntity movie) async {
    await apiManger.postData(
      endPoint: EndPoints.favoritesAdd,
      body: {
        "movieId": movie.id,
        "name": movie.title,
        "rating": movie.rating,
        "imageURL": movie.mediumCoverImage,
        "year": movie.year,
      },
    );
  }

  Future<void> removeMovieFromFav(String movieId) async {
    await apiManger.deleteData(
      endPoint: "${EndPoints.removeFavoritesmovieId}/$movieId",
    );
  }
}
