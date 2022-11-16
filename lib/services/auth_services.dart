import 'package:dio/dio.dart';

import '../models/admin.dart';

abstract class AuthServices {
  static Future<Admin> login(String username, String password) async {
    try {
      final dio = Dio(BaseOptions(baseUrl: "http://localhost:8080"));
      var response = await dio.post(
        "/api/admin/login",
        data: {"username": username, "password": password},
      );
      return response.statusCode == 200
          ? Admin.fromJson(response.data)
          : throw Exception("Error");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<Admin> logout() async {
    try {
      final dio = Dio(BaseOptions(baseUrl: "http://localhost:8080"));
      var response = await dio.post("/api/admin/logout");
      return response.statusCode == 200
          ? Admin.fromJson(response.data)
          : throw Exception("Error");
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
