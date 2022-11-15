import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/result.dart';
import '../models/tabungan.dart';

abstract class UserServices {
  static Future<Result> hitungResult({
    required Tabungan tabungan,
  }) async {
    try {
      final dio = Dio(BaseOptions(baseUrl: "http://localhost:8080"));
      var response =
          await dio.post("/api/result/hitung", data: tabungan.toJson());
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

// var response = await dio.post('/api/result/hitung', data: {
//         "setoran_awal": setoranAwal,
//         "setoran_lanjutan_minimal": setoranLanjutanMinimal,
//         "saldo_minimum": saldoMinimum,
//         "suku_bunga": sukuBunga,
//         "fungsionalitas": {
//           "bisnis": bisnis,
//           "investasi": investasi,
//           "transaksional": transaksional
//         },
//         "biaya_admin": biayaAdmin,
//         "biaya_penarikan_habis": biayaPenarikanHabis,
//         "kategori_umur_pengguna": {
//           "dewasa": dewasa,
//           "remaja": remaja,
//           "anak": anak
//         }
//       });
