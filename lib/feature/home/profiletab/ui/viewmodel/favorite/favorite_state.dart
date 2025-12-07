sealed class FavouriteState {}

class FavouriteInitial extends FavouriteState {}

class FavouriteLoading extends FavouriteState {}

class FavouriteAdded extends FavouriteState {}

class FavouriteRemoved extends FavouriteState {}

class FavouriteError extends FavouriteState {
  final String message;
  FavouriteError(this.message);
}
