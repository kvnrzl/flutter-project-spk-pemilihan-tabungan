import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPref {
  SharedPreferences? prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> setString(String key, String value) async {
    await prefs!.setString(key, value);
  }

  String? getString(String key) {
    return prefs!.getString(key);
  }

  Future<void> setInt(String key, int value) async {
    await prefs!.setInt(key, value);
  }

  int? getInt(String key) {
    return prefs!.getInt(key);
  }

  Future<void> setBool(String key, bool value) async {
    await prefs!.setBool(key, value);
  }

  bool? getBool(String key) {
    return prefs!.getBool(key);
  }

  Future<void> setDouble(String key, double value) async {
    await prefs!.setDouble(key, value);
  }

  double? getDouble(String key) {
    return prefs!.getDouble(key);
  }

  Future<void> setStringList(String key, List<String> value) async {
    await prefs!.setStringList(key, value);
  }

  List<String>? getStringList(String key) {
    return prefs!.getStringList(key);
  }

  Future<void> remove(String key) async {
    await prefs!.remove(key);
  }

  Future<void> clear() async {
    await prefs!.clear();
  }

  Set<String>? getKeys() {
    return prefs!.getKeys();
  }

  bool? containsKey(String key) {
    return prefs!.containsKey(key);
  }

  Future<void> reload() async {
    await prefs!.reload();
  }
}
