import 'package:movie_app/feature/home/hometab/domain/entities/list_movie_entity.dart';

class ListMovieResponseModel extends ListMovieResponseEntity {
  // final String status;
  // final String statusMessage;
  // final int movieCount;
  // final int limit;
  // final int pageNumber;
  // final List<MovieModel> movies;

  ListMovieResponseModel({
    required super.status,
    required super.statusMessage,
    required super.movieCount,
    required super.limit,
    required super.pageNumber,
    required super.movies,
  });

  factory ListMovieResponseModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? {};
    return ListMovieResponseModel(
      status: json['status'] ?? '',
      statusMessage: json['status_message'] ?? '',
      movieCount: data['movie_count'] ?? 0,
      limit: data['limit'] ?? 0,
      pageNumber: data['page_number'] ?? 0,
      movies: (data['movies'] as List<dynamic>? ?? [])
          .map((e) => MovieModel.fromJson(e))
          .toList(),
    );
  }
}

class MovieModel extends MovieEntity {
  MovieModel({
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
    required super.largeCoverImage,
    required super.state,
    required super.dateUploaded,
    required super.dateUploadedUnix,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'] ?? 0,
      url: json['url'] ?? '',
      imdbCode: json['imdb_code'] ?? '',
      title: json['title'] ?? '',
      titleEnglish: json['title_english'] ?? '',
      titleLong: json['title_long'] ?? '',
      slug: json['slug'] ?? '',
      year: json['year'] ?? 0,
      rating: (json['rating'] ?? 0).toDouble(),
      runtime: json['runtime'] ?? 0,
      genres: (json['genres'] as List<dynamic>? ?? [])
          .map((e) => e.toString())
          .toList(),
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
      largeCoverImage: json['large_cover_image'] ?? '',
      state: json['state'] ?? '',
      dateUploaded: json['date_uploaded'] ?? '',
      dateUploadedUnix: json['date_uploaded_unix'] ?? 0,
    );
  }
}
