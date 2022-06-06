import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  final SharedPreferences _sharedPreferences;

  Preferences(this._sharedPreferences);

  Future<void> set<T>(String key, T value) async {
    if (value is bool) {
      await _sharedPreferences.setBool(key, value);
    } else if (value is String) {
      await _sharedPreferences.setString(key, value);
    } else {
      throw Exception('$T is not supported.');
    }
  }

  T? get<T>(String key) {
    if (T == bool) {
      return _sharedPreferences.getBool(key) as T?;
    } else if (T == String) {
      return _sharedPreferences.getString(key) as T?;
    } else {
      throw Exception('$T is not supported');
    }
  }
}
