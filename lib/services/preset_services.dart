import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

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

  Future<PresetBobot> updatePresetBobot({
    required double setoranAwal,
    required double setoranLanjutanMinimal,
    required double saldoMinimum,
    required double sukuBunga,
    required double fungsionalitas,
    required double biayaAdmin,
    required double biayaPenarikanHabis,
    required double kategoriUmurPengguna,
  }) async {
    try {
      final dio = Dio(BaseOptions(baseUrl: "http://localhost:8080"));
      var response = await dio.put("/api/preset/update", data: {
        "setoran_awal": setoranAwal,
        "setoran_lanjutan_minimal": setoranLanjutanMinimal,
        "saldo_minimum": saldoMinimum,
        "suku_bunga": sukuBunga,
        "fungsionalitas": fungsionalitas,
        "biaya_admin": biayaAdmin,
        "biaya_penarikan_habis": biayaPenarikanHabis,
        "kategori_umur_pengguna": kategoriUmurPengguna
      });
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
