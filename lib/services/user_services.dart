import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/result.dart';
import '../models/input_recomendation.dart';
import '../models/tabungan.dart';

abstract class UserServices {
  static Future<Result> hitungResult({
    required InputRecomendation inputRecomendation,
  }) async {
    try {
      final dio = Dio(BaseOptions(baseUrl: "http://localhost:8080"));
      var response = await dio.post("/api/result/hitung",
          data: inputRecomendation.toJson());
      if (response.statusCode == 200) {
        return Result.fromJson(response.data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      debugPrint("catch error nih");
      throw Exception(e.toString());
    }
  }

  static Future<ListTabungan> getAllTabungan() async {
    try {
      final dio = Dio(BaseOptions(baseUrl: "http://localhost:8080"));
      var response = await dio.get("/api/tabungan/list");
      if (response.statusCode == 200) {
        return ListTabungan.fromJson(response.data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      debugPrint("catch error nih");
      throw Exception(e.toString());
    }
  }

  static Future<Tabungan> getTabunganById(int id) async {
    try {
      final dio = Dio(BaseOptions(baseUrl: "http://localhost:8080"));
      var response = await dio.get("/api/tabungan/detail/$id/");
      if (response.statusCode == 200) {
        return Tabungan.fromJson(response.data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      debugPrint("catch error nih");
      throw Exception(e.toString());
    }
  }
}
