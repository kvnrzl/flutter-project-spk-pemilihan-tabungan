import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../constants/service.dart';
import '../models/tabungan.dart';

abstract class AlternativeServices {
  static Future<ListTabungan> getAllTabungan() async {
    try {
      final dio = Dio(BaseOptions(
        baseUrl: baseUrl,
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
      ));
      // dio.interceptors.add(InterceptorsWrapper(
      //   onRequest: (options, handler) async {
      //     // debugPrint("OPTIONS : ${options.extra["withCredentials"]}");
      //     // debugPrint("OPTIONS : ${options.extra["set-cookie"]}");
      //     // debugPrint("OPTIONS : ${options.headers["set-cookie"]}");
      //     options.headers["set-cookie"] = "ABC";
      //     return handler.next(options);
      //   },
      // ));
      dio.options.headers["set-cookie"] = "ABC";
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
      final dio = Dio(BaseOptions(baseUrl: baseUrl));
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

  static Future<Tabungan> createTabungan({
    required String namaTabungan,
    required int setoranAwal,
    required int setoranLanjutanMinimal,
    required int saldoMinimum,
    required double sukuBunga,
    required String fungsionalitas,
    required int biayaAdmin,
    required int biayaPenarikanHabis,
    required String kategoriUmurPengguna,
  }) async {
    try {
      final dio = Dio(BaseOptions(baseUrl: baseUrl));
      // var adapter = BrowserHttpClientAdapter()..withCredentials = true;
      // dio.httpClientAdapter = adapter;

      var response = await dio.post("/api/tabungan/create", data: {
        "nama_tabungan": namaTabungan,
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
        return Tabungan.fromJson(response.data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      debugPrint("catch error nih");
      throw Exception(e.toString());
    }
  }

  static Future<Tabungan> updateTabungan({
    required int id,
    required String namaTabungan,
    required int setoranAwal,
    required int setoranLanjutanMinimal,
    required int saldoMinimum,
    required double sukuBunga,
    required String fungsionalitas,
    required int biayaAdmin,
    required int biayaPenarikanHabis,
    required String kategoriUmurPengguna,
  }) async {
    try {
      final dio = Dio(BaseOptions(baseUrl: baseUrl));
      var response = await dio.put("/api/tabungan/detail/$id/update", data: {
        "nama_tabungan": namaTabungan,
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
        return Tabungan.fromJson(response.data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      debugPrint("catch error nih");
      throw Exception(e.toString());
    }
  }

  static Future<void> deleteTabungan({required int id}) async {
    try {
      final dio = Dio(BaseOptions(baseUrl: baseUrl));
      // var adapter = BrowserHttpClientAdapter();
      // adapter.withCredentials = true;
      // dio.httpClientAdapter = adapter;
      debugPrint("TEST123");
      var response = await dio.delete("/api/tabungan/detail/$id/delete");
      debugPrint("TEST321");
      if (response.statusCode == 200) {
        // return Tabungan.fromJson(response.data)
        return;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      debugPrint("catch error nih");
      throw Exception(e.toString());
    }
  }
}
