class RegisterResponseEntity {
  final String message;
  final RegisterDataEntity data;

  RegisterResponseEntity({required this.message, required this.data});
}

class RegisterDataEntity {
  final String email;
  final String password;
  final String name;
  final String phone;
  final int avatarId;
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  RegisterDataEntity({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
    required this.avatarId,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });
}
