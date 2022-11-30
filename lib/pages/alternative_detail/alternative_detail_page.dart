import 'package:flutter/material.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/constants/style.dart';
import 'package:get/get.dart';

import '../../models/tabungan.dart';
import 'widgets/new_custom_text_detail.dart';

class AlternativeDetailPage extends StatelessWidget {
  final Tabungan tabungan;
  const AlternativeDetailPage({super.key, required this.tabungan});

  final listItem = const [
    NewCustomTextDetail(text: "Nama Tabungan"),
    NewCustomTextDetail(text: "Setoran Awal"),
    NewCustomTextDetail(text: "Setoran Lanjutan"),
    NewCustomTextDetail(text: "Saldo Minimum"),
    NewCustomTextDetail(text: "Suku Bunga"),
    NewCustomTextDetail(text: "Fungsionalitas"),
    NewCustomTextDetail(text: "Biaya Admin"),
    NewCustomTextDetail(text: "Biaya Penarikan Habis"),
    NewCustomTextDetail(text: "Kategori Umur Pengguna")
  ];

  @override
  Widget build(BuildContext context) {
    var tabunganJson = tabungan.toJson();
    var data = tabunganJson["data"];
    final listItemValue = [
      NewCustomTextDetail(text: "${data["nama_tabungan"]}"),
      NewCustomTextDetail(text: "${data["setoran_awal"]}"),
      NewCustomTextDetail(text: "${data["setoran_lanjutan_minimal"]}"),
      NewCustomTextDetail(text: "${data['saldo_minimum']}"),
      NewCustomTextDetail(text: "${data['suku_bunga']}%"),
      NewCustomTextDetail(text: "${data['fungsionalitas']}"),
      NewCustomTextDetail(text: "${data['biaya_admin']}"),
      NewCustomTextDetail(text: "${data['biaya_penarikan_habis']}"),
      NewCustomTextDetail(text: "${data['kategori_umur_pengguna']}")
    ];
    // var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Detail Tabungan",
              style: TextStyle(fontSize: 28),
            ),
            const SizedBox(height: 10),
            const Text("Detail dari tabungan yang dipilih"),
            const SizedBox(height: 50),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 50),
              margin: const EdgeInsets.symmetric(horizontal: 150),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: listItem.map((e) => e).toList(),
                  ),
                  Column(
                    children: List.generate(
                      listItem.length,
                      (index) => const NewCustomTextDetail(text: ":"),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: listItemValue.map((e) => e).toList(),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(lightGrey),
              ),
              child: const Text("Back"),
            )
          ],
        ),
      ),
    );
  }
}
