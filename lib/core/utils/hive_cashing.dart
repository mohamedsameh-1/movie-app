import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:movie_app/feature/home/hometab/data/model/list_movie_model.dart';

class HiveCashing {
  static const String moviesListBox = 'moviesListBox';
  static Future<Box> openBox() async {
    if (!Hive.isBoxOpen(moviesListBox)) {
      return Hive.openBox(moviesListBox);
    }
    return Hive.box(moviesListBox);
  }

  static Future<void> saveAvailableNow(
    ListMovieResponseModel listMovies,
  ) async {
    var box = await openBox();
    await box.put('availableNow', jsonEncode(listMovies.toJson()));
  }

  static Future<ListMovieResponseModel?> getAvailableNow() async {
    var box = await openBox();
    final data = box.get('availableNow');
    // return ListMovieResponseModel.fromJson(box.get('availableNow'));
    if (data != null && data is String) {
      final map = jsonDecode(data) as Map<String, dynamic>;
      return ListMovieResponseModel.fromJson(map);
    }
    return null;
  }
}
