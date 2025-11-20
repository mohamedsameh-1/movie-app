// login_model.dart

import 'package:movie_app/feature/auth/domain/entities/log_in_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel({required super.message, required super.token});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      message: json['message'] as String,
      token: json['data'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'message': message, 'data': token};
  }
}
