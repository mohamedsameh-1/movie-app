import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/api/api_constants.dart';
import 'package:movie_app/core/api/api_manger.dart';
import 'package:movie_app/core/api/end_points.dart';
import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/home/hometab/data/model/list_movie_model.dart';
import 'package:movie_app/feature/home/searchtab/data/datasource/remote/search_movie_data_source.dart';

@Injectable(as: SearchMovieDataSource)
class SearchMovieDataSourceImpl implements SearchMovieDataSource {
  final ApiManger apiManger;
  SearchMovieDataSourceImpl({required this.apiManger});
  @override
  Future<Either<Failure, ListMovieResponseModel>> searchMovieByTitle(
    String movieTitle,
  ) async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();

      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        //has internet
        var response = await apiManger.getData(
          ApiConstants.getmovieUrl,
          endPoint: EndPoints.listMovie,
          queryParameters: {'query_term': movieTitle},
        );
        print(response.data);
        var searchMovieResponse = ListMovieResponseModel.fromJson(
          response.data,
        );
        if (response.statusCode! >= 200 && response.statusCode! <= 300) {
          //response success
          return Right(searchMovieResponse);
        } else {
          //server Erorr
          return Left(
            ServerFailure(failureMessage: searchMovieResponse.statusMessage),
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
