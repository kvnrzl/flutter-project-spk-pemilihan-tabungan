import 'package:flutter/material.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/pages/alternative_add/widgets/form_add.dart';
import 'package:get/get.dart';

class AlternativeAddPage extends StatelessWidget {
  const AlternativeAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "Tambah Alternatif Tabungan",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text("Masukkan nilai sesuai dengan informasi tabungan"),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: "Petunjuk pengisian",
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                            "1. Masukkan nilai sesuai dengan informasi tabungan"),
                        Text("2. Isi nama tabungan berupa text"),
                        Text(
                            "3. Isi 6 kriteria pertama menggunakan bilangan yang sesuai dengan petunjuk nomor 1"),
                        Text(
                            "4. Untuk kriteria fungsionalitas dan kategori umur pengguna isi dengan pilihan drop down yang telah tersedia"),
                      ],
                    ),
                    textConfirm: "OK",
                    confirmTextColor: Colors.white,
                    onConfirm: () => Get.back(),
                  );
                },
                child: const Text("Petunjuk pengisian"),
              ),
            ),
            const SizedBox(height: 20),
            const FormAdd(),
          ],
        ),
      ),
    );
  }
}
