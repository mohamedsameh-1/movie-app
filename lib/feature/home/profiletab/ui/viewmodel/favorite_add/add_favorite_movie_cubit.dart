import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:injectable/injectable.dart';
import 'package:movie_app/feature/home/profiletab/domain/usecase/favorite_movie_use_case.dart';
import 'package:movie_app/feature/home/profiletab/ui/viewmodel/favorite_add/add_favorite_movie_state.dart';

@injectable
class AddFavoriteCubit extends Cubit<AddFavoriteState> {
  final AddFavoriteUseCase addFavoriteUseCase;

  AddFavoriteCubit(this.addFavoriteUseCase) : super(AddFavoriteInitialState());

  void addToFavorite(
    String movieId,
    String name,
    double rating,
    String imageURL,
    String year,
  ) async {
    emit(AddFavoriteLoadingState());
    final either = await addFavoriteUseCase.execute(
      movieId,
      name,
      rating,
      imageURL,
      year,
    );

    either.fold(
      (error) => emit(AddFavoriteFailureState(error)),
      (success) => emit(AddFavoriteSuccessState(success)),
    );
  }
}
