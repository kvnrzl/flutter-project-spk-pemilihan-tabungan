import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/services/storage_services.dart';
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
      // dio.interceptors.add(InterceptorsWrapper(
      //   onRequest: (options, handler) async {
      //     debugPrint("OPTIONS : ${options.extra["withCredentials"]}");
      //     debugPrint("OPTIONS : ${options.extra["set-cookie"]}");
      //     debugPrint("OPTIONS : ${options.headers["set-cookie"]}");
      //     return handler.next(options);
      //   },
      //   onResponse: (r, handler) async {
      //     debugPrint("OPTIONS : ${r.extra["withCredentials"]}");
      //     debugPrint("OPTIONS : ${r.extra["set-cookie"]}");
      //     debugPrint("OPTIONS : ${r.headers["set-cookie"]}");
      //     debugPrint("OPTIONS : ${r.headers.map["set-cookie"]}");
      //     return handler.next(r);
      //   },
      // ));

      // var client = BrowserHttpClientAdapter()..withCredentials = true;
      // http.Response response;
      // try {
      //   response = await client.get(
      //     Uri.parse(url),
      //     headers: allHeaders,
      //   );
      // } finally {
      //   client.close();
      // }
      var response = await dio.post(
        "/api/admin/login",
        data: {"username": username, "password": password},
      );

      if (response.statusCode == 200) {
        final admin = Admin.fromJson(response.data);
        await StorageServices.setAdmin(admin);

        // final cookie = document.cookie!;
        // debugPrint("This is COOKIE : $cookie");
        // final entity = cookie.split("; ").map((item) {
        //   final split = item.split("=");
        //   return MapEntry(split[0], split[1]);
        // });
        // final cookieMap = Map.fromEntries(entity);
        // debugPrint("This is COOKIE : $cookieMap");
        // debugPrint("This is COOKIE : ${cookieMap["jwt"]}");
        debugPrint("This is COOKIE : ${response.headers["set-cookie"]}");
        debugPrint(
            "This is COOKIE : ${response.headers.map["content-length"]}");
        debugPrint("This is COOKIE : ${response.headers["content-length"]}");

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

  static Future<int> logout() async {
    try {
      var token = await StorageServices.getToken("jwt-token");
      var admin = await StorageServices.getToken("admin");
      debugPrint("INI ISI TOKEN JWT: $token");
      debugPrint("INI ISI STORAGE ADMIN: $admin");

      if (token.isNotEmpty) {
        final dio = Dio(BaseOptions(baseUrl: "http://localhost:8080"));
        var response = await dio.post("/api/admin/logout");
        debugPrint("INI ISI ERROR KETIKA LOGOUT : ");
        // response.headers["Cet-Cookie"];
        await StorageServices.deleteToken("jwt-token");
        await StorageServices.deleteToken("admin");
        return response.statusCode!;
      } else {
        throw Exception("There is no JWT Token");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
