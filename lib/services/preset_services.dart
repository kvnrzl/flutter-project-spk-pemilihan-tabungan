import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/constants/service.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/models/error.dart';

import '../models/input_recomendation.dart';
import '../models/preset_bobot.dart';

abstract class PresetServices {
  static Future<dynamic> getPresetBobot() async {
    try {
      final dio = Dio(BaseOptions(baseUrl: baseUrl));
      var response = await dio.get("/api/preset/");
      if (response.statusCode == 200) {
        return PresetBobot.fromJson(response.data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      if (e is DioError) {
        return ErrorResponse.fromJson(e.response!.data);
      } else {
        throw Exception(e.toString());
      }
    }
  }

  static Future<PresetBobot> createPresetBobot(
      {required PresetKriteria presetKriteria}) async {
    try {
      final dio = Dio(BaseOptions(baseUrl: baseUrl));
      var response = await dio.post(
        "/api/preset/create",
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

  static Future<PresetBobot> updatePresetBobot(
      {required PresetKriteria presetKriteria}) async {
    try {
      final dio = Dio(BaseOptions(baseUrl: baseUrl));
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
