import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/input_recomendation.dart';
import '../models/preset_bobot.dart';

abstract class PresetServices {
  static Future<PresetBobot> getPresetBobot() async {
    try {
      final dio = Dio(BaseOptions(baseUrl: "http://localhost:8080"));
      var response = await dio.get("/api/preset/");
      if (response.statusCode == 200) {
        return PresetBobot.fromJson(response.data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      debugPrint("catch error nih");
      throw Exception(e.toString());
    }
  }

  static Future<PresetBobot> updatePresetBobot(
      {required PresetKriteria presetKriteria}) async {
    try {
      final dio = Dio(BaseOptions(baseUrl: "http://localhost:8080"));
      var response = await dio.put(
        "/api/preset/update",
        data: presetKriteria.toJson(),
      );
      if (response.statusCode == 200) {
        return PresetBobot.fromJson(response.data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      debugPrint("catch error nih");
      throw Exception(e.toString());
    }
  }
}
