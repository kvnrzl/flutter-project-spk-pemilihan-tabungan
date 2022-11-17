import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/services/storage_services.dart';
import '../models/admin.dart';

abstract class AuthServices {
  static Future<Admin> login(String username, String password) async {
    try {
      final dio = Dio(BaseOptions(baseUrl: "http://localhost:8080"));
      var response = await dio.post(
        "/api/admin/login",
        data: {"username": username, "password": password},
      );
      if (response.statusCode == 200) {
        final admin = Admin.fromJson(response.data);
        await StorageServices.setAdmin(admin);

        var token = response.data["data"]["token"];
        await StorageServices.setToken('jwt-token', token);

        return admin;
      } else {
        throw Exception("Login failed");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<void> logout() async {
    try {
      var token = await StorageServices.getToken("jwt-token");
      var admin = await StorageServices.getToken("admin");
      debugPrint("INI ISI TOKEN JWT: $token");
      debugPrint("INI ISI STORAGE ADMIN: $admin");

      if (token.isNotEmpty) {
        // final dio = Dio(BaseOptions(baseUrl: "http://localhost:8080"));
        // var response = await dio.post("/api/admin/logout");
        debugPrint("INI ISI ERROR KETIKA LOGOUT : ");
        // response.headers["Cet-Cookie"];
        await StorageServices.deleteToken("jwt-token");
        await StorageServices.deleteToken("admin");
      } else {
        throw Exception("There is no JWT Token");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
