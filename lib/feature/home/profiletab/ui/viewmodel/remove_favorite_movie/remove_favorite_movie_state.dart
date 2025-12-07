import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/home/profiletab/domain/entities/remove_movie_entity.dart';

abstract class RemoveFavoriteState {}

class RemoveFavoriteInitial extends RemoveFavoriteState {}

class RemoveFavoriteLoading extends RemoveFavoriteState {}

class RemoveFavoriteSuccess extends RemoveFavoriteState {
  final RemoveFavoriteEntity removeFavoriteEntity;
  RemoveFavoriteSuccess({required this.removeFavoriteEntity});
}

class RemoveFavoriteError extends RemoveFavoriteState {
  final Failure failure;
  RemoveFavoriteError({required this.failure});
}
