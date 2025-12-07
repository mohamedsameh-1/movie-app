import 'package:movie_app/feature/home/profiletab/domain/entities/get_profile_entity.dart';

class GetProfileResponseModel extends GetProfileResponseEntity {
  GetProfileResponseModel({
    required super.message,
    required GetProfileDataModel super.data,
  });

  factory GetProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return GetProfileResponseModel(
      message: json['message'],
      data: GetProfileDataModel.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'message': message, 'data': (data as GetProfileDataModel).toJson()};
  }
}

class GetProfileDataModel extends GetProfileDataEntity {
  GetProfileDataModel({
    required super.id,
    required super.email,
    required super.password,
    required super.name,
    required super.phone,
    required super.avaterId,
    required super.createdAt,
    required super.updatedAt,
    required super.v,
  });

  factory GetProfileDataModel.fromJson(Map<String, dynamic> json) {
    return GetProfileDataModel(
      id: json['_id'],
      email: json['email'],
      password: json['password'],
      name: json['name'],
      phone: json['phone'],
      avaterId: json['avaterId'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'email': email,
      'password': password,
      'name': name,
      'phone': phone,
      'avaterId': avaterId,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
    };
  }
}
