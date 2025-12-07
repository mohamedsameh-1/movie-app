import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/home/profiletab/domain/entities/favorite_movie_entity.dart';

abstract class GetFavoriteMoviesState {}

class GetFavoriteMoviesInitial extends GetFavoriteMoviesState {}

class GetFavoriteMoviesLoading extends GetFavoriteMoviesState {}

class GetFavoriteMoviesSuccess extends GetFavoriteMoviesState {
  final GetFavoriteMoviesResponseEntity response;
  GetFavoriteMoviesSuccess(this.response);
}

class GetFavoriteMoviesError extends GetFavoriteMoviesState {
  final Failure failure;
  GetFavoriteMoviesError({required this.failure});
}
