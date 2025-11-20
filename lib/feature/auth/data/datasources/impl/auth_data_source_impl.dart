import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/api/api_manger.dart';
import 'package:movie_app/core/api/end_points.dart';
import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/feature/auth/data/datasources/contract/auth_data_source.dart';
import 'package:movie_app/feature/auth/data/model/log_in_model.dart';
import 'package:movie_app/feature/auth/data/model/register_model.dart';

@Injectable(as: AuthDataSource)
class AuthDataSourceImpl implements AuthDataSource {
  final ApiManger apiManger;
  AuthDataSourceImpl({required this.apiManger});

  get connectivityResult => null;
  @override
  Future<Either<Failure, RegisterCreatedResponseModel>> register(
    String name,
    String email,
    String password,
    String confirmPassword,
    String phone,
    int avatarId,
  ) async {
    try {
      // final List<ConnectivityResult> connectivityResult = await (Connectivity()
      //     .checkConnectivity());
      var connectivityResult = await Connectivity().checkConnectivity();

      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        //has internet
        var response = await apiManger.postData(
          endPoint: EndPoints.register,
          body: {
            "name": name,
            "email": email,
            "password": password,
            "confirmPassword": confirmPassword,
            "phone": phone,
            "avaterId": avatarId + 1,
          },
          headers: {"Content-Type": "application/json"},
        );
        print(response.data);
        var registerResponse = RegisterCreatedResponseModel.fromJson(
          response.data,
        );
        if (response.statusCode! >= 200 && response.statusCode! <= 300) {
          //response success
          return Right(registerResponse);
        } else {
          //server Erorr
          return Left(ServerFailure(failureMessage: registerResponse.message));
          //   String errorMessage;
          //   if (response.data['message'] is List) {
          //     errorMessage = (response.data['message'] as List).join('\n');
          //   } else {
          //     errorMessage = response.data['message'].toString();
          //   }
          //   return Left(ServerFailure(failureMessage: errorMessage));
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
  Future<Either<Failure, LoginModel>> logIn(
    String email,
    String password,
  ) async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();

      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        //has internet
        var response = await apiManger.postData(
          endPoint: EndPoints.logIn,
          body: {"email": email, "password": password},
          headers: {"Content-Type": "application/json"},
        );
        print(response.data);
        var logInResponse = LoginModel.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! <= 300) {
          //response success
          return Right(logInResponse);
        } else {
          //server Erorr
          return Left(ServerFailure(failureMessage: logInResponse.message));
          // String errorMessage;
          // if (response.data['message'] is List) {
          //   errorMessage = (response.data['message'] as List).join('\n');
          // } else {
          //   errorMessage = response.data['message'].toString();
          // }
          // return Left(ServerFailure(failureMessage: errorMessage));
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
