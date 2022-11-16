import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/result.dart';
import '../models/input_recomendation.dart';

abstract class RecomendationServices {
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
}
