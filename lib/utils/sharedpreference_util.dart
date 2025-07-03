import 'package:shared_preferences/shared_preferences.dart';

class SharedpreferenceUtil {
  static SharedPreferences? _pref;

  static Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
  }

  static Future<void> setString(String key, String value) async {
    await _pref?.setString(value, key);
  }

  static String? getString(String key) {
    return _pref?.getString(key);
  }

  static Future<void> setBool(String key, bool value) async {
    await _pref?.setBool(key, value);
  }

  static bool? getBool(String key) {
    return _pref?.getBool(key);
  }

  static Future<void> remove(String key) async {
    await _pref?.remove(key);
  }

  static Future<void> clear() async {
    await _pref?.clear();
  }
}
