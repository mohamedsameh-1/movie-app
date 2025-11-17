import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static SharedPreferences? _shared;

  /// Call this method in main() before runApp()
  static Future<void> init() async {
    _shared = await SharedPreferences.getInstance();
  }

  /// Save any data type (String, int, double, bool, List<String>)
  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await _shared!.setString(key, value);
    if (value is int) return await _shared!.setInt(key, value);
    if (value is bool) return await _shared!.setBool(key, value);
    if (value is double) return await _shared!.setDouble(key, value);
    if (value is List<String>) return await _shared!.setStringList(key, value);

    throw UnsupportedError("Type not supported");
  }

  /// Get saved data (It returns dynamic)
  static dynamic getData(String key) {
    return _shared!.get(key);
  }

  /// Remove specific key
  static Future<bool> remove(String key) async {
    return await _shared!.remove(key);
  }

  /// Clear all SharedPreferences data
  static Future<bool> clear() async {
    return await _shared!.clear();
  }
}
