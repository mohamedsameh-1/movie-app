import 'package:movie_app/feature/auth/domain/entities/register_entity.dart';

class RegisterCreatedResponseModel extends RegisterResponseEntity {
  RegisterCreatedResponseModel({required super.message, required super.data});

  factory RegisterCreatedResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterCreatedResponseModel(
      message: json['message'] ?? '',
      data: RegisterDataModel.fromJson(json['data'] ?? {}),
    );
  }
}

class RegisterDataModel extends RegisterDataEntity {
  RegisterDataModel({
    required super.email,
    required super.password,
    required super.name,
    required super.phone,
    required super.avatarId,
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required super.v,
  });

  factory RegisterDataModel.fromJson(Map<String, dynamic> json) {
    return RegisterDataModel(
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      avatarId: json['avaterId'] ?? 0, // نفس spelling الـ API
      id: json['_id'] ?? '',
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? '') ?? DateTime.now(),
      v: json['__v'] ?? 0,
    );
  }
}
