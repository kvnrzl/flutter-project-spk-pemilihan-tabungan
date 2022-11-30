import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/input_recomendation.dart';
import 'widgets/form_preset.dart';

class PresetPage extends StatelessWidget {
  final bool? isPreset;
  final NilaiIdeal? nilaiIdeal;
  const PresetPage({super.key, this.isPreset = true, this.nilaiIdeal});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "Input Nilai Bobot Kriteria",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text("Total nilai bobot kriteria harus 1"),
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
                            "1. Masukkan nilai bobot sesuai tingkat prioritas kriteria"),
                        Text("2. Total nilai bobot kriteria harus 1"),
                        Text(
                            "3. Semakin tinggi nilai maka kriteria tersebut semakin diprioritaskan"),
                        Text(
                            "4. Pengguna dapat menggunakan bobot kriteria yang tersedia atau menginputkan sendiri"),
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
            FormPreset(
              isPreset: isPreset!,
              nilaiIdeal: nilaiIdeal,
            ),
          ],
        ),
      ),
    );
  }
}
