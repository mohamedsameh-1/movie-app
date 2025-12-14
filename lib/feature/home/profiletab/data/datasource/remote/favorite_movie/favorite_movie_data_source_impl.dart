import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/api/api_constants.dart';
import 'package:movie_app/core/api/api_manger.dart';
import 'package:movie_app/core/api/end_points.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/core/utils/shared_prefrence.dart';
import 'package:movie_app/feature/home/profiletab/data/datasource/remote/favorite_movie/favorite_movie_data_source.dart';
import 'package:movie_app/feature/home/profiletab/data/model/favorite_movie_model.dart';
import 'package:movie_app/feature/home/profiletab/data/model/remove_movie_model.dart';

@Injectable(as: FavoriteMovieDataSource)
class FavoriteMovieDataSourceImpl implements FavoriteMovieDataSource {
  final ApiManger apiManger;
  FavoriteMovieDataSourceImpl({required this.apiManger});
  @override
  Future<Either<Failure, AddFavoriteResponseModel>> addToFavorite(
    String movieId,
    String name,
    double rating,
    String imageURL,
    String year,
  ) async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();

      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        final token = SharedPreference.getData(
          AppStrings.tokenOfLoggedInOrCreatedAccount,
        );
        //has internet
        var response = await apiManger.postData(
          // ApiConstants.baseUrl,
          endPoint: EndPoints.favoritesAdd,
          headers: {"Authorization": "Bearer $token"},
          body: {
            "movieId": movieId,
            "name": name,
            "rating": rating,
            "imageURL": imageURL,
            "year": year,
          },
        );
        print(response.data);
        var favoriteAddResponse = AddFavoriteResponseModel.fromJson(
          response.data,
        );
        if (response.statusCode! >= 200 && response.statusCode! <= 300) {
          //response success
          return Right(favoriteAddResponse);
        } else {
          //server Erorr
          return Left(
            ServerFailure(failureMessage: favoriteAddResponse.message),
          );
        }
      } else {
        //Network Error
        return Left(
          NetworkFailure(
            failureMessage: 'No InterNet , check Your Connections',
          ),
        );
      }
    } catch (e) {
      return Left(Failure(failureMessage: e.toString()));
    }
  }

  /////
  @override
  Future<Either<Failure, GetFavoriteMoviesResponseModel>>
  getFavoriteMovies() async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();

      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        final token = SharedPreference.getData(
          AppStrings.tokenOfLoggedInOrCreatedAccount,
        );
        //has internet
        var response = await apiManger.getData(
          ApiConstants.baseUrl,
          endPoint: EndPoints.favoritesAll,
          headers: {"Authorization": "Bearer $token"},
        );
        print(response.data);
        var getAavoriteAllResponse = GetFavoriteMoviesResponseModel.fromJson(
          response.data,
        );
        if (response.statusCode! >= 200 && response.statusCode! <= 300) {
          //response success
          return Right(getAavoriteAllResponse);
        } else {
          //server Erorr
          return Left(
            ServerFailure(failureMessage: getAavoriteAllResponse.message),
          );
        }
      } else {
        //Network Error
        return Left(
          NetworkFailure(
            failureMessage: 'No InterNet , check Your Connections',
          ),
        );
      }
    } catch (e) {
      return Left(Failure(failureMessage: e.toString()));
    }
  }

  /// remove movie
  @override
  Future<Either<Failure, RemoveFavoriteModel>> removeFavoriteMovies(
    String movieId,
  ) async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();

      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        final token = SharedPreference.getData(
          AppStrings.tokenOfLoggedInOrCreatedAccount,
        );
        //has internet
        var response = await apiManger.deleteData(
          // ApiConstants.baseUrl,
          endPoint: "${EndPoints.removeFavoritesmovieId}/$movieId",
          headers: {"Authorization": "Bearer $token"},
        );
        print(response.data);
        var removeFavoriteAllResponse = RemoveFavoriteModel.fromJson(
          response.data,
        );
        if (response.statusCode! >= 200 && response.statusCode! <= 300) {
          //response success
          return Right(removeFavoriteAllResponse);
        } else {
          //server Erorr
          return Left(
            ServerFailure(failureMessage: removeFavoriteAllResponse.message),
          );
        }
      } else {
        //Network Error
        return Left(
          NetworkFailure(
            failureMessage: 'No InterNet , check Your Connections',
          ),
        );
      }
    } catch (e) {
      return Left(Failure(failureMessage: e.toString()));
    }
  }
}
