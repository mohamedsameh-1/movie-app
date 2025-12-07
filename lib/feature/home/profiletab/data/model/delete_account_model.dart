import 'package:movie_app/feature/home/profiletab/domain/entities/delete_account_entity.dart';

class DeleteAccountModel extends DeleteAccountEntity {
  DeleteAccountModel({required super.message});

  factory DeleteAccountModel.fromJson(Map<String, dynamic> json) {
    return DeleteAccountModel(message: json['message'] as String);
  }

  Map<String, dynamic> toJson() {
    return {'message': message};
  }
}
