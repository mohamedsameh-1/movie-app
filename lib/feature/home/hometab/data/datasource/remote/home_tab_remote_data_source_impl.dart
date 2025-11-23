import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/api/api_constants.dart';
import 'package:movie_app/core/api/api_manger.dart';
import 'package:movie_app/core/api/end_points.dart';
import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/home/hometab/data/datasource/remote/home_tab_remote_data_source.dart';
import 'package:movie_app/feature/home/hometab/data/model/list_movie_model.dart';

@Injectable(as: HomeTabRemoteDataSource)
class HomeTabRemoteDataSourceImpl implements HomeTabRemoteDataSource {
  final ApiManger apiManger;
  HomeTabRemoteDataSourceImpl({required this.apiManger});
  @override
  Future<Either<Failure, ListMovieResponseModel>> getListMovie() async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();

      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        //has internet
        var response = await apiManger.getData(
          ApiConstants.getmovieUrl,
          endPoint: EndPoints.listMovie,
        );
        print(response.data);
        var listMovieResponse = ListMovieResponseModel.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! <= 300) {
          //response success
          return Right(listMovieResponse);
        } else {
          //server Erorr
          return Left(
            ServerFailure(failureMessage: listMovieResponse.statusMessage),
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
