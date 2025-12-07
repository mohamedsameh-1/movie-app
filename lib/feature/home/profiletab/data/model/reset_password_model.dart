import 'package:movie_app/feature/home/profiletab/domain/entities/reset_password_entity.dart';

class ResetPasswordResponseModel extends ResetPasswordResponseEntity {
  ResetPasswordResponseModel({required super.message});

  factory ResetPasswordResponseModel.fromJson(Map<String, dynamic> json) {
    return ResetPasswordResponseModel(message: json['message'] as String);
  }

  Map<String, dynamic> toJson() {
    return {'message': message};
  }
}
