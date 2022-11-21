import 'package:dio/dio.dart';
import '../models/admin.dart';

abstract class AuthServices {
  static Future<Admin> login(String username, String password) async {
    try {
      final dio = Dio(BaseOptions(
        baseUrl: "http://localhost:8080",
        connectTimeout: 15000,
        receiveTimeout: 13000,
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Credentials": "true",
          "Access-Control-Allow-Methods":
              "POST,HEAD,PATCH, OPTIONS, GET, PUT, DELETE",
          "Access-Control-Allow-Headers": "*",
        },
        // extra: {"withCredentials": true},
      ));
      var response = await dio.post(
        "/api/admin/login",
        data: {"username": username, "password": password},
      );

      if (response.statusCode == 200) {
        final admin = Admin.fromJson(response.data);
        // var token = response.data["data"]["token"];
        // await SharedPref.setString("jwt-token", token);

        return admin;
      } else {
        throw Exception("Login failed");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<int> logout() async {
    try {
      final dio = Dio(BaseOptions(baseUrl: "http://localhost:8080"));
      var response = await dio.post("/api/admin/logout");
      // await StorageServices.deleteToken("jwt-token");
      // await StorageServices.deleteToken("admin");
      return response.statusCode!;
      // if (response.statusCode == 200) {
      //   await SharedPref.remove("jwt-token");
      // } else {
      //   throw Exception("There is something error");
      // }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
