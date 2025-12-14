import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/home/profiletab/domain/entities/add_favorite_movie_entity.dart';

sealed class FavouriteState {}

class FavouriteInitial extends FavouriteState {}

class FavouriteLoading extends FavouriteState {}

class FavouriteAdded extends FavouriteState {}

class FavouriteLoaded extends FavouriteState {
  final List<FavoriteMovieEntity> getFavMovie;
  FavouriteLoaded({required this.getFavMovie});
}

class FavouriteRemoved extends FavouriteState {}

class FavouriteError extends FavouriteState {
  final Failure failure;
  FavouriteError({required this.failure});
}
