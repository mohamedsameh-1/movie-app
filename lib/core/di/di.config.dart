// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../feature/auth/data/datasources/contract/auth_data_source.dart'
    as _i244;
import '../../feature/auth/data/datasources/impl/auth_data_source_impl.dart'
    as _i490;
import '../../feature/auth/data/repo/auth_repo_impl.dart' as _i945;
import '../../feature/auth/domain/repo/auth_repo.dart' as _i1021;
import '../../feature/auth/domain/usecase/log_in_use_case.dart' as _i73;
import '../../feature/auth/domain/usecase/register_use_case.dart' as _i717;
import '../../feature/auth/ui/viewmodel/login/log_in_cubit.dart' as _i1069;
import '../../feature/auth/ui/viewmodel/register/register_cubit.dart' as _i518;
import '../../feature/home/exploretab/view_model/browse_cubit.dart' as _i938;
import '../../feature/home/hometab/data/datasource/remote/home_tab_remote_data_source.dart'
    as _i615;
import '../../feature/home/hometab/data/datasource/remote/home_tab_remote_data_source_impl.dart'
    as _i403;
import '../../feature/home/hometab/data/repo/home_tab_repo_impl.dart' as _i765;
import '../../feature/home/hometab/domain/repo/home_tab_repo.dart' as _i79;
import '../../feature/home/hometab/domain/usecase/get_list_movie_use_case.dart'
    as _i563;
import '../../feature/home/hometab/ui/viewmodel/list_movie/list_movie_cubit.dart'
    as _i700;
import '../../feature/home/movie_details/data/datasources/remote/movie_details_remote_data_source.dart'
    as _i406;
import '../../feature/home/movie_details/data/datasources/remote/movie_details_remote_data_source_impl.dart'
    as _i636;
import '../../feature/home/movie_details/data/repo/movie_details_repo_impl.dart'
    as _i446;
import '../../feature/home/movie_details/domain/repo/movie_details_repo.dart'
    as _i220;
import '../../feature/home/movie_details/domain/usecase/movie_details_use_case.dart'
    as _i498;
import '../../feature/home/movie_details/domain/usecase/movie_suggestion_use_case.dart'
    as _i1050;
import '../../feature/home/movie_details/ui/viewmodel/movie_details/movie_details_cubit.dart'
    as _i426;
import '../../feature/home/movie_details/ui/viewmodel/movie_suggestion/movie_suggestion_cubit.dart'
    as _i990;
import '../../feature/home/profiletab/data/datasource/remote/favorite_movie/favorite_movie_data_source.dart'
    as _i99;
import '../../feature/home/profiletab/data/datasource/remote/favorite_movie/favorite_movie_data_source_impl.dart'
    as _i954;
import '../../feature/home/profiletab/data/datasource/remote/profile/profile_remote_data_source.dart'
    as _i586;
import '../../feature/home/profiletab/data/datasource/remote/profile/profile_remote_data_source_impl.dart'
    as _i988;
import '../../feature/home/profiletab/data/datasource/remote/reset_pass/reset_password_data_source.dart'
    as _i730;
import '../../feature/home/profiletab/data/datasource/remote/reset_pass/reset_password_data_source_impl.dart'
    as _i570;
import '../../feature/home/profiletab/data/repo/favorite_repo_impl.dart'
    as _i199;
import '../../feature/home/profiletab/data/repo/profile_repo_impl.dart'
    as _i643;
import '../../feature/home/profiletab/data/repo/reset_password_repo_impl.dart'
    as _i1001;
import '../../feature/home/profiletab/domain/repo/favorite_repo.dart' as _i786;
import '../../feature/home/profiletab/domain/repo/profile_repo.dart' as _i857;
import '../../feature/home/profiletab/domain/repo/reset_password_repo.dart'
    as _i380;
import '../../feature/home/profiletab/domain/usecase/delete_account_use_case.dart'
    as _i527;
import '../../feature/home/profiletab/domain/usecase/favorite_movie_use_case.dart'
    as _i510;
import '../../feature/home/profiletab/domain/usecase/get_all_favorite_use_case.dart'
    as _i834;
import '../../feature/home/profiletab/domain/usecase/get_profile_use_case.dart'
    as _i376;
import '../../feature/home/profiletab/domain/usecase/remove_movie_use_case.dart'
    as _i334;
import '../../feature/home/profiletab/domain/usecase/reset_password_use_case.dart'
    as _i610;
import '../../feature/home/profiletab/ui/viewmodel/delete_account/delete_account_cubit.dart'
    as _i520;
import '../../feature/home/profiletab/ui/viewmodel/favorite_add/add_favorite_movie_cubit.dart'
    as _i937;
import '../../feature/home/profiletab/ui/viewmodel/get_favorite_movie/get_favorite_movie_cubit.dart'
    as _i425;
import '../../feature/home/profiletab/ui/viewmodel/get_profile_cubit/get_profile_cubit.dart'
    as _i909;
import '../../feature/home/profiletab/ui/viewmodel/remove_favorite_movie/remove_favorite_movie_cubit.dart'
    as _i50;
import '../../feature/home/profiletab/ui/viewmodel/reset_password/reset_password_cubit.dart'
    as _i1022;
import '../../feature/home/searchtab/data/datasource/remote/search_movie_data_source.dart'
    as _i600;
import '../../feature/home/searchtab/data/datasource/remote/search_movie_data_source_impl.dart'
    as _i209;
import '../../feature/home/searchtab/data/repo/search_movie_repo_impl.dart'
    as _i61;
import '../../feature/home/searchtab/domian/repo/search_movie_repo.dart'
    as _i793;
import '../../feature/home/searchtab/domian/usecase/search_movie_use_case.dart'
    as _i687;
import '../../feature/home/searchtab/ui/view_model/search_movie_cubit.dart'
    as _i756;
import '../api/api_manger.dart' as _i339;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i339.ApiManger>(() => _i339.ApiManger());
    gh.factory<_i600.SearchMovieDataSource>(() =>
        _i209.SearchMovieDataSourceImpl(apiManger: gh<_i339.ApiManger>()));
    gh.factory<_i244.AuthDataSource>(
        () => _i490.AuthDataSourceImpl(apiManger: gh<_i339.ApiManger>()));
    gh.factory<_i586.ProfileRemoteDataSource>(() =>
        _i988.ProfileRemoteDataSourceImpl(apiManger: gh<_i339.ApiManger>()));
    gh.factory<_i99.FavoriteMovieDataSource>(() =>
        _i954.FavoriteMovieDataSourceImpl(apiManger: gh<_i339.ApiManger>()));
    gh.factory<_i1021.AuthrRepo>(
        () => _i945.AuthRepoImpl(authDataSource: gh<_i244.AuthDataSource>()));
    gh.factory<_i615.HomeTabRemoteDataSource>(() =>
        _i403.HomeTabRemoteDataSourceImpl(apiManger: gh<_i339.ApiManger>()));
    gh.factory<_i793.SearchMovieRepo>(() => _i61.SearchMovieRepoImpl(
        searchMovieDataSource: gh<_i600.SearchMovieDataSource>()));
    gh.factory<_i857.ProfileRepo>(() => _i643.ProfileRepoImpl(
        profileRemoteDataSource: gh<_i586.ProfileRemoteDataSource>()));
    gh.factory<_i79.HomeTabRepo>(() => _i765.HomeTabRepoImpl(
        homeTabRemoteDataSource: gh<_i615.HomeTabRemoteDataSource>()));
    gh.factory<_i730.ResetPasswordDataSource>(() =>
        _i570.ResetPasswordDataSourceImpl(apiManger: gh<_i339.ApiManger>()));
    gh.factory<_i527.DeleteAccountUseCase>(
        () => _i527.DeleteAccountUseCase(profileRepo: gh<_i857.ProfileRepo>()));
    gh.factory<_i376.GetProfileUseCase>(
        () => _i376.GetProfileUseCase(profileRepo: gh<_i857.ProfileRepo>()));
    gh.factory<_i380.ResetPasswordRepo>(() => _i1001.ResetPasswordRepoImpl(
        resetPasswordDataSource: gh<_i730.ResetPasswordDataSource>()));
    gh.factory<_i406.MovieDetailsRemoteDataSource>(() =>
        _i636.MovieDetailsRemoteDataSourceImpl(
            apiManger: gh<_i339.ApiManger>()));
    gh.factory<_i610.ResetPasswordUseCase>(() => _i610.ResetPasswordUseCase(
        resetPasswordRepo: gh<_i380.ResetPasswordRepo>()));
    gh.factory<_i786.FavoriteRepo>(() => _i199.FavoriteRepoImpl(
        favoriteMovieDataSource: gh<_i99.FavoriteMovieDataSource>()));
    gh.factory<_i1022.ResetPasswordCubit>(
        () => _i1022.ResetPasswordCubit(gh<_i610.ResetPasswordUseCase>()));
    gh.factory<_i687.SearchMovieUseCase>(() =>
        _i687.SearchMovieUseCase(searchMovieRepo: gh<_i793.SearchMovieRepo>()));
    gh.factory<_i834.GetFavoriteMoviesUseCase>(
        () => _i834.GetFavoriteMoviesUseCase(gh<_i786.FavoriteRepo>()));
    gh.factory<_i425.GetFavoriteMoviesCubit>(() =>
        _i425.GetFavoriteMoviesCubit(gh<_i834.GetFavoriteMoviesUseCase>()));
    gh.factory<_i520.DeleteAccountCubit>(
        () => _i520.DeleteAccountCubit(gh<_i527.DeleteAccountUseCase>()));
    gh.factory<_i334.RemoveFavoriteUseCase>(
        () => _i334.RemoveFavoriteUseCase(gh<_i786.FavoriteRepo>()));
    gh.factory<_i563.GetListMovieUseCase>(
        () => _i563.GetListMovieUseCase(homeTabRepo: gh<_i79.HomeTabRepo>()));
    gh.factory<_i220.MovieDetailsRepo>(() => _i446.MovieDetailsRepoImpl(
        movieDetailsRemoteDataSource:
            gh<_i406.MovieDetailsRemoteDataSource>()));
    gh.factory<_i73.LogInUseCase>(
        () => _i73.LogInUseCase(authrRepo: gh<_i1021.AuthrRepo>()));
    gh.factory<_i717.RegisterUseCase>(
        () => _i717.RegisterUseCase(authrRepo: gh<_i1021.AuthrRepo>()));
    gh.factory<_i700.ListMovieCubit>(
        () => _i700.ListMovieCubit(gh<_i563.GetListMovieUseCase>()));
    gh.factory<_i909.GetProfileCubit>(
        () => _i909.GetProfileCubit(gh<_i376.GetProfileUseCase>()));
    gh.factory<_i510.AddFavoriteUseCase>(
        () => _i510.AddFavoriteUseCase(gh<_i786.FavoriteRepo>()));
    gh.factory<_i756.SearchMovieCubit>(
        () => _i756.SearchMovieCubit(gh<_i687.SearchMovieUseCase>()));
    gh.factory<_i938.BrowseCubit>(
        () => _i938.BrowseCubit(gh<_i563.GetListMovieUseCase>()));
    gh.factory<_i518.RegisterCubit>(() => _i518.RegisterCubit(
          gh<_i717.RegisterUseCase>(),
          gh<_i73.LogInUseCase>(),
        ));
    gh.factory<_i498.MovieDetailsUseCase>(() => _i498.MovieDetailsUseCase(
        movieDetailsRepo: gh<_i220.MovieDetailsRepo>()));
    gh.factory<_i1050.MovieSuggestionUseCase>(() =>
        _i1050.MovieSuggestionUseCase(
            movieDetailsRepo: gh<_i220.MovieDetailsRepo>()));
    gh.factory<_i990.MovieSuggestionCubit>(
        () => _i990.MovieSuggestionCubit(gh<_i1050.MovieSuggestionUseCase>()));
    gh.factory<_i1069.LogInCubit>(
        () => _i1069.LogInCubit(gh<_i73.LogInUseCase>()));
    gh.factory<_i50.RemoveFavoriteMovieCubit>(
        () => _i50.RemoveFavoriteMovieCubit(gh<_i334.RemoveFavoriteUseCase>()));
    gh.factory<_i426.MovieDetailsCubit>(
        () => _i426.MovieDetailsCubit(gh<_i498.MovieDetailsUseCase>()));
    gh.factory<_i937.AddFavoriteCubit>(
        () => _i937.AddFavoriteCubit(gh<_i510.AddFavoriteUseCase>()));
    return this;
  }
}
