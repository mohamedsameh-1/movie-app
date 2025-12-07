import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/api/api_constants.dart';
import 'package:movie_app/core/api/api_manger.dart';
import 'package:movie_app/core/api/end_points.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/core/utils/shared_prefrence.dart';
import 'package:movie_app/feature/home/profiletab/data/datasource/remote/profile/profile_remote_data_source.dart';
import 'package:movie_app/feature/home/profiletab/data/model/delete_account_model.dart';
import 'package:movie_app/feature/home/profiletab/data/model/get_profile_model.dart';

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ApiManger apiManger;
  ProfileRemoteDataSourceImpl({required this.apiManger});
  @override
  Future<Either<Failure, GetProfileResponseModel>> getProfile() async {
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
          endPoint: EndPoints.profile,
          headers: {"Authorization": "Bearer $token"},
        );
        print(response.data);
        var getProfileResponse = GetProfileResponseModel.fromJson(
          response.data,
        );
        if (response.statusCode! >= 200 && response.statusCode! <= 300) {
          //response success
          return Right(getProfileResponse);
        } else {
          //server Erorr
          return Left(
            ServerFailure(failureMessage: getProfileResponse.message),
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
  Future<Either<Failure, DeleteAccountModel>> deleteAccount() async {
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
          endPoint: EndPoints.profile,
          headers: {"Authorization": "Bearer $token"},
        );
        print(response.data);
        var deleteResponse = DeleteAccountModel.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! <= 300) {
          //response success
          return Right(deleteResponse);
        } else {
          //server Erorr
          return Left(ServerFailure(failureMessage: deleteResponse.message));
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
