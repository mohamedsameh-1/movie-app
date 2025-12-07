import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/feature/home/movie_details/domain/usecase/movie_details_use_case.dart';
import 'package:movie_app/feature/home/movie_details/ui/viewmodel/movie_details/movie_details_state.dart';

@injectable
class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final MovieDetailsUseCase movieDetailsUseCase;
  // final String movieId;
  bool isFav = false;
  MovieDetailsCubit(this.movieDetailsUseCase)
    : super(MovieDetailsInitialState());

  void getMovieDetailsById(String movieId) async {
    emit(MovieDetailsLoadingState());
    var either = await movieDetailsUseCase.excute(movieId);
    either.fold((error) => emit(MovieDetailsFailureState(failure: error)), (
      success,
    ) {
      // movieId=  success.movie.id.toString();
      emit(MovieDetailsSuccessState(movieDetailsResponseEntity: success));
    });
  }

  // void toggleFavorite() {
  //   isFav = !isFav;
  //   emit(MovieDetailsFavoriteToggledState(isFav));
  // }
}

// @injectable
// class MovieDetailsCubit extends Cubit<MovieDetailsState> {
//   final MovieDetailsUseCase movieDetailsUseCase;
//   final AddFavoriteUseCase addFavoriteUseCase;
//   final RemoveFavoriteUseCase removeFavoriteUseCase;

//   bool isFav = false;

//   MovieDetailsCubit(
//     this.movieDetailsUseCase,
//     this.addFavoriteUseCase,
//     this.removeFavoriteUseCase,
//   ) : super(MovieDetailsInitialState());

//   /// Call this first when opening movie details
//   Future<void> loadMovie(
//     String movieId,
//     List<FavoriteMovieEntity> favorites,
//   ) async {
//     emit(MovieDetailsLoadingState());

//     /// 1) Get Movie Details API
//     final detailsResult = await movieDetailsUseCase.excute(movieId);

//     detailsResult.fold(
//       (error) => emit(MovieDetailsFailureState(failure: error)),
//       (success) {
//         /// 2) Check if this movie already exists in favorites
//         isFav = favorites.any((movie) => movie.movieId == movieId);

//         emit(
//           MovieDetailsSuccessState(
//             movieDetailsResponseEntity: success,
//             isFav: isFav,
//           ),
//         );
//       },
//     );
//   }
// }

//   /// Toggle Add/Remove Favorite
//   Future<void> toggleFavorite(MovieDetailsResponseEntity movie) async {
//     if (!isFav) {
//       /// ============= ADD FAVORITE =============
//       var result = await addFavoriteUseCase.execute(
//         movie.movie.id.toString(),
//         movie.movie.title,
//         movie.movie.rating.toDouble(),
//         movie.movie.backgroundImage,
//         movie.movie.year.toString(),
//       );

//       result.fold(
//         (error) => {},
//         (_) {
//           isFav = true;
//           emit(MovieDetailsFavoriteToggledState(true));
//         },
//       );
//     } else {
//       /// ============= REMOVE FAVORITE =============
//       var result = await removeFavoriteUseCase.call(movie.movie.id.toString());

//       result.fold(
//         (error) => {},
//         (_) {
//           isFav = false;
//           emit(MovieDetailsFavoriteToggledState(false));
//         },
//       );
//     }
//   }
// }
