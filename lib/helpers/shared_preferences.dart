import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPref {
  static Future<void> setString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static setInt(String key, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

  static getInt(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getInt(key);
  }

  static Future<void> setBool(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool(key, value);
  }

  static getBool(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool(key);
  }

  static Future<void> setDouble(String key, double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setDouble(key, value);
  }

  static getDouble(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getDouble(key);
  }

  static Future<void> setStringList(String key, List<String> value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setStringList(key, value);
  }

  static getStringList(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getStringList(key);
  }

  static Future<void> remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove(key);
  }

  static Future<void> clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.clear();
  }

  static getKeys() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getKeys();
  }

  static containsKey(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.containsKey(key);
  }

  Future<void> reload() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.reload();
  }
}
