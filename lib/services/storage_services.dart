import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/admin.dart';

abstract class StorageServices {
  static const storage = FlutterSecureStorage();

  static Future<void> setAdmin(Admin admin) async {
    try {
      await storage.write(key: 'admin', value: jsonEncode(admin.toJson()));
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<void> setToken(String key, String token) async {
    try {
      await storage.write(key: key, value: token);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<String> getToken(String key) async {
    try {
      var token = await storage.read(key: key);
      return token!;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<void> deleteToken(String key) async {
    try {
      await storage.delete(key: key);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
