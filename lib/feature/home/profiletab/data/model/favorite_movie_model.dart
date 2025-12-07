import 'package:movie_app/feature/home/profiletab/domain/entities/favorite_movie_entity.dart';

class FavoriteMovieModel extends FavoriteMovieEntity {
  FavoriteMovieModel({
    required super.movieId,
    required super.name,
    required super.rating,
    required super.imageURL,
    required super.year,
  });

  factory FavoriteMovieModel.fromJson(Map<String, dynamic> json) {
    return FavoriteMovieModel(
      movieId: json['movieId'],
      name: json['name'],
      rating: (json['rating'] as num).toDouble(),
      imageURL: json['imageURL'],
      year: json['year'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "movieId": movieId,
      "name": name,
      "rating": rating,
      "imageURL": imageURL,
      "year": year,
    };
  }
}

class AddFavoriteResponseModel extends AddFavoriteResponseEntity {
  AddFavoriteResponseModel({required super.message, required super.data});

  factory AddFavoriteResponseModel.fromJson(Map<String, dynamic> json) {
    return AddFavoriteResponseModel(
      message: json["message"],
      data: FavoriteMovieModel.fromJson(json["data"]),
    );
  }
}

/// get fav movie
class GetFavoriteMoviesResponseModel extends GetFavoriteMoviesResponseEntity {
  GetFavoriteMoviesResponseModel({required super.message, required super.data});

  factory GetFavoriteMoviesResponseModel.fromJson(Map<String, dynamic> json) {
    return GetFavoriteMoviesResponseModel(
      message: json["message"],
      data: (json["data"] as List)
          .map((item) => FavoriteMovieModel.fromJson(item))
          .toList(),
    );
  }
}
