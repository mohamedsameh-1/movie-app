import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/home/profiletab/domain/entities/favorite_movie_entity.dart';

abstract class AddFavoriteState {}

class AddFavoriteInitialState extends AddFavoriteState {}

class AddFavoriteLoadingState extends AddFavoriteState {}

class AddFavoriteFailureState extends AddFavoriteState {
  final Failure failure;
  AddFavoriteFailureState(this.failure);
}

class AddFavoriteSuccessState extends AddFavoriteState {
  final AddFavoriteResponseEntity response;
  AddFavoriteSuccessState(this.response);
}
