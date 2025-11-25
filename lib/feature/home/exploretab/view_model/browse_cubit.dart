import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/feature/home/exploretab/view_model/browse_state.dart';
import 'package:movie_app/feature/home/hometab/domain/entities/list_movie_entity.dart';
import 'package:movie_app/feature/home/hometab/domain/usecase/get_list_movie_use_case.dart';

@injectable
class BrowseCubit extends Cubit<BrowseState> {
  final GetListMovieUseCase getListMovieUseCase;
  List<MovieEntity> moviesList = [];
  List<String> gener = [];
  late ListMovieResponseEntity currentMovieResponse;

  BrowseCubit(this.getListMovieUseCase) : super(BrowseInitialState());
  void browseState() async {
    emit(BrowseLoadingState());
    var either = await getListMovieUseCase.excute();
    either.fold((error) => emit(BrowseFailureState(failure: error)), (
      successMovie,
    ) {
      moviesList = successMovie.movies;

      /// get geners without repeating
      var genersSet = <String>{}; //set
      for (var movie in moviesList) {
        genersSet.addAll(movie.genres);
      }
      gener = genersSet.toList();

      currentMovieResponse = successMovie;
      emit(BrowseSuccessState(listMovieResponseEntity: currentMovieResponse));
    });
  }

  List<MovieEntity> getMovieByGener(String gener) {
    return moviesList
        .where((element) => element.genres.contains(gener))
        .toList();
  }

  int selectedIndex = 0;
  void changeIndeTab(int value) {
    selectedIndex = value;
    emit(BrowseSuccessState(listMovieResponseEntity: currentMovieResponse));
  }
}
