import 'package:flutter/material.dart';

import '../../models/tabungan.dart';

class AlternativeDetailPage extends StatelessWidget {
  final Tabungan tabungan;
  const AlternativeDetailPage({super.key, required this.tabungan});

  @override
  Widget build(BuildContext context) {
    var tabunganJson = tabungan.toJson();
    var data = tabunganJson["data"];
    // var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Detail Tabungan",
              style: TextStyle(fontSize: 28),
            ),
            const Text("Detail dari tabungan yang dipilih"),
            const SizedBox(height: 10),
            Text("Nama Tabungan : ${data["nama_tabungan"]}"),
            Text("Setoran Awal : ${data["setoran_awal"]}"),
            Text("Setoran Lanjutan : ${data["setoran_lanjutan_minimal"]}"),
            Text("Saldo Minimum : ${data['saldo_minimum']}"),
            Text("Suku Bunga ${data['suku_bunga']}"),
            Text("Fungsionalitas : ${data['fungsionalitas']}"),
            Text("BiayaAdmin : ${data['biaya_admin']}"),
            Text("Biaya Penarikan Habis = ${data['biaya_penarikan_habis']}"),
            Text("Kategori Umur Pengguna = ${data['kategori_umur_pengguna']}"),
          ],
        ),
      ),
    );
  }
}
