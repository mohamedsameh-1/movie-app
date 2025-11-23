import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/api/api_constants.dart';
import 'package:movie_app/core/api/api_manger.dart';
import 'package:movie_app/core/api/end_points.dart';
import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/home/movie_details/data/datasources/remote/movie_details_remote_data_source.dart';
import 'package:movie_app/feature/home/movie_details/data/model/movie_details_model.dart';
import 'package:movie_app/feature/home/movie_details/data/model/movie_suggestion_model.dart';

@Injectable(as: MovieDetailsRemoteDataSource)
class MovieDetailsRemoteDataSourceImpl implements MovieDetailsRemoteDataSource {
  final ApiManger apiManger;
  MovieDetailsRemoteDataSourceImpl({required this.apiManger});
  @override
  Future<Either<Failure, MovieDetailsResponseModel>> getMovieDetails(
    String movieId,
  ) async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();

      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        //has internet
        var response = await apiManger.getData(
          ApiConstants.getmovieUrl,
          endPoint: EndPoints.movieDetails,
          queryParameters: {'movie_id': movieId},
        );
        print(response.data);
        var movieDetailsResponse = MovieDetailsResponseModel.fromJson(
          response.data,
        );
        if (response.statusCode! >= 200 && response.statusCode! <= 300) {
          //response success
          return Right(movieDetailsResponse);
        } else {
          //server Erorr
          return Left(
            ServerFailure(failureMessage: movieDetailsResponse.statusMessage),
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

  @override
  Future<Either<Failure, MovieSuggestionResponseModel>> getMovieSuggestion(
    String movieId,
  ) async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        //has internet
        var response = await apiManger.getData(
          ApiConstants.getmovieUrl,
          endPoint: EndPoints.movieSuggestion,
          queryParameters: {'movie_id': movieId},
        );
        print(response.data);
        var movieSuggestionResponse = MovieSuggestionResponseModel.fromJson(
          response.data,
        );
        if (response.statusCode! >= 200 && response.statusCode! <= 300) {
          //response success
          return Right(movieSuggestionResponse);
        } else {
          //server Erorr
          return Left(
            ServerFailure(
              failureMessage: movieSuggestionResponse.statusMessage,
            ),
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
