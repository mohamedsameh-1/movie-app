/// add movie to fav
class AddFavoriteResponseEntity {
  final String message;
  final FavoriteMovieEntity data;

  AddFavoriteResponseEntity({required this.message, required this.data});
}

/// get fav movie
class GetFavoriteMoviesResponseEntity {
  final String message;
  final List<FavoriteMovieEntity> data;

  GetFavoriteMoviesResponseEntity({required this.message, required this.data});
}

class FavoriteMovieEntity {
  final String movieId;
  final String name;
  final double rating;
  final String imageURL;
  final String year;

  FavoriteMovieEntity({
    required this.movieId,
    required this.name,
    required this.rating,
    required this.imageURL,
    required this.year,
  });
}
