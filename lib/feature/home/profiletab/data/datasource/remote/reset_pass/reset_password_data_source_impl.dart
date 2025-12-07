import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/api/api_constants.dart';
import 'package:movie_app/core/api/api_manger.dart';
import 'package:movie_app/core/api/end_points.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/core/utils/shared_prefrence.dart';
import 'package:movie_app/feature/home/profiletab/data/datasource/remote/reset_pass/reset_password_data_source.dart';
import 'package:movie_app/feature/home/profiletab/data/model/reset_password_model.dart';

@Injectable(as: ResetPasswordDataSource)
class ResetPasswordDataSourceImpl implements ResetPasswordDataSource {
  final ApiManger apiManger;
  ResetPasswordDataSourceImpl({required this.apiManger});
  @override
  Future<Either<Failure, ResetPasswordResponseModel>> restPassword(
    String oldPassword,
    String newPassword,
  ) async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();

      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        final token = SharedPreference.getData(
          AppStrings.tokenOfLoggedInOrCreatedAccount,
        );
        //has internet
        var response = await apiManger.patchData(
          ApiConstants.baseUrl,
          endPoint: EndPoints.authResetPassword,
          headers: {"Authorization": "Bearer $token"},
          body: {"oldPassword": oldPassword, "newPassword": newPassword},
        );
        print(response.data);
        var resetResponse = ResetPasswordResponseModel.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! <= 300) {
          //response success
          return Right(resetResponse);
        } else {
          //server Erorr
          return Left(ServerFailure(failureMessage: resetResponse.message));
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
