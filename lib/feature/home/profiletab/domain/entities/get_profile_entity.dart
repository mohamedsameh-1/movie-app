class GetProfileResponseEntity {
  final String message;
  final GetProfileDataEntity data;

  GetProfileResponseEntity({required this.message, required this.data});
}

class GetProfileDataEntity {
  final String id;
  final String email;
  final String password;
  final String name;
  final String phone;
  final int avaterId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  GetProfileDataEntity({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
    required this.avaterId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });
}
