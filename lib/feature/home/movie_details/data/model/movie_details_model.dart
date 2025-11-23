import 'package:movie_app/feature/home/movie_details/domain/entity/movie_details_entity.dart';

class MovieDetailsResponseModel extends MovieDetailsResponseEntity {
  MovieDetailsResponseModel({
    required super.movie,
    required super.status,
    required super.statusMessage,
  });

  factory MovieDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsResponseModel(
      movie: MovieDetailsModel.fromJson(json["data"]["movie"]),
      status: json["status"],
      statusMessage: json["status_message"],
    );
  }
}

class MovieDetailsModel extends MovieDetailsEntity {
  MovieDetailsModel({
    required super.id,
    required super.url,
    required super.imdbCode,
    required super.title,
    required super.titleEnglish,
    required super.titleLong,
    required super.slug,
    required super.year,
    required super.rating,
    required super.runtime,
    required super.genres,
    required super.likeCount,
    required super.descriptionIntro,
    required super.descriptionFull,
    required super.ytTrailerCode,
    required super.language,
    required super.mpaRating,
    required super.backgroundImage,
    required super.backgroundImageOriginal,
    required super.smallCoverImage,
    required super.mediumCoverImage,
    required super.largeCoverImage,
    required super.dateUploaded,
    required super.dateUploadedUnix,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      id: json["id"],
      url: json["url"],
      imdbCode: json["imdb_code"],
      title: json["title"],
      titleEnglish: json["title_english"],
      titleLong: json["title_long"],
      slug: json["slug"],
      year: json["year"],
      rating: (json["rating"] as num).toDouble(),
      runtime: json["runtime"],
      genres: List<String>.from(json["genres"]),
      likeCount: json["like_count"],
      descriptionIntro: json["description_intro"],
      descriptionFull: json["description_full"],
      ytTrailerCode: json["yt_trailer_code"],
      language: json["language"],
      mpaRating: json["mpa_rating"],
      backgroundImage: json["background_image"],
      backgroundImageOriginal: json["background_image_original"],
      smallCoverImage: json["small_cover_image"],
      mediumCoverImage: json["medium_cover_image"],
      largeCoverImage: json["large_cover_image"],
      dateUploaded: json["date_uploaded"],
      dateUploadedUnix: json["date_uploaded_unix"],
    );
  }
}
