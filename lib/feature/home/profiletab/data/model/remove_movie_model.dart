import 'package:movie_app/feature/home/profiletab/domain/entities/remove_movie_entity.dart';

class RemoveFavoriteModel extends RemoveFavoriteEntity {
  RemoveFavoriteModel({required super.message});

  factory RemoveFavoriteModel.fromJson(Map<String, dynamic> json) {
    return RemoveFavoriteModel(message: json["message"]);
  }
}
