import 'package:movie_app/feature/home/movie_details/domain/entity/movie_suggestion_entity.dart';

class MovieSuggestionResponseModel extends MovieSuggestionResponseEntity {
  MovieSuggestionResponseModel({
    required super.status,
    required super.statusMessage,
    required super.movieCount,
    required super.movies,
  });

  factory MovieSuggestionResponseModel.fromJson(Map<String, dynamic> json) =>
      MovieSuggestionResponseModel(
        status: json['status'] ?? '',
        statusMessage: json['status_message'] ?? '',
        movieCount: json['data']['movie_count'] ?? 0,
        movies: (json['data']['movies'] as List<dynamic>? ?? [])
            .map((e) => MovieSuggestionModel.fromJson(e))
            .toList(),
      );
}

class MovieSuggestionModel extends MovieSuggestionEntity {
  MovieSuggestionModel({
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
    required super.summary,
    required super.descriptionFull,
    required super.synopsis,
    required super.ytTrailerCode,
    required super.language,
    required super.mpaRating,
    required super.backgroundImage,
    required super.backgroundImageOriginal,
    required super.smallCoverImage,
    required super.mediumCoverImage,
    required super.state,
    required super.dateUploaded,
    required super.dateUploadedUnix,
  });

  factory MovieSuggestionModel.fromJson(Map<String, dynamic> json) =>
      MovieSuggestionModel(
        id: json['id'],
        url: json['url'] ?? '',
        imdbCode: json['imdb_code'] ?? '',
        title: json['title'] ?? '',
        titleEnglish: json['title_english'] ?? '',
        titleLong: json['title_long'] ?? '',
        slug: json['slug'] ?? '',
        year: json['year'] ?? 0,
        rating: (json['rating'] ?? 0).toDouble(),
        runtime: json['runtime'] ?? 0,
        genres: List<String>.from(json['genres'] ?? []),
        summary: json['summary'] ?? '',
        descriptionFull: json['description_full'] ?? '',
        synopsis: json['synopsis'] ?? '',
        ytTrailerCode: json['yt_trailer_code'] ?? '',
        language: json['language'] ?? '',
        mpaRating: json['mpa_rating'] ?? '',
        backgroundImage: json['background_image'] ?? '',
        backgroundImageOriginal: json['background_image_original'] ?? '',
        smallCoverImage: json['small_cover_image'] ?? '',
        mediumCoverImage: json['medium_cover_image'] ?? '',
        state: json['state'] ?? '',
        dateUploaded: json['date_uploaded'] ?? '',
        dateUploadedUnix: json['date_uploaded_unix'] ?? 0,
      );
}
