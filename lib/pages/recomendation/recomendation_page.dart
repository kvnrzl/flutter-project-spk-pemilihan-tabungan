import 'package:flutter/material.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/pages/recomendation/widgets/form_preference.dart';
import 'package:get/get.dart';

class RecomendationPage extends StatelessWidget {
  const RecomendationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "Input Nilai Preferensi",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text("Masukkan nilai sesuai kebutuhan pengguna"),
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
                        Text("1. Masukkan nilai preferensi sesuai kebutuhan"),
                        Text(
                            "2. Untuk 6 kriteria pertama isi dengan bilangan yang sesuai dengan petunjuk nomor 1"),
                        Text(
                            "3. Untuk kriteria fungsionalitas dan kategori umur pengguna isi dengan bilangan dengan ketentuan berikut :"),
                        Text(
                            "\t- Nilai 1 adalah nilai paling rendah (tidak diprioritaskan)"),
                        Text(
                            "\t- Nilai 5 adalah nilai paling tinggi (sangat diprioritaskan)"),
                        Text(
                            "\t- Semakin tinggi nilai maka kriteria tersebut semakin diprioritaskan"),
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
            const FormPreference(),
          ],
        ),
      ),
    );
  }
}
