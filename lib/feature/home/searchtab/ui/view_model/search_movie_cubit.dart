import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/feature/home/hometab/domain/entities/list_movie_entity.dart';
import 'package:movie_app/feature/home/searchtab/domian/usecase/search_movie_use_case.dart';
import 'package:movie_app/feature/home/searchtab/ui/view_model/search_movie_state.dart';

@injectable
class SearchMovieCubit extends Cubit<SearchMovieState> {
  final SearchMovieUseCase searchMovieUseCase;
  SearchMovieCubit(this.searchMovieUseCase) : super(SearchMovieInitialState());
  int page = 1;
  String currentQuery = '';
  bool isLoadingMore = false;
  List<MovieEntity> movies = [];
  void getListMovie(String movieTitle, {bool isLoadMore = false}) async {
    print(' page before request: $page');
    print('length ${movies.length}');
    if (isLoadingMore) return;
    if (!isLoadMore) {
      currentQuery = movieTitle;
      page = 1;
      movies.clear();
      emit(SearchMovieLoadingState());
    }
    isLoadingMore = true;
    // emit(PaginatSearchMovieLoadingState(isLoadingMore: true));
    var either = await searchMovieUseCase.excute(movieTitle, page);
    either.fold(
      (error) {
        isLoadingMore = false;
        emit(SearchMovieFailureState(failure: error));
      },
      (success) {
        page++;
        movies.addAll(success.movies);
        isLoadingMore = false;
        print(page);
        print(movies.length);
        emit(SearchMovieSuccessState(movies: movies, isLoadingMore: false));
      },
    );
  }

  void clearSearch() {
    page = 1;
    movies.clear();
    currentQuery = '';
    emit(SearchMovieInitialState());
  }
}
