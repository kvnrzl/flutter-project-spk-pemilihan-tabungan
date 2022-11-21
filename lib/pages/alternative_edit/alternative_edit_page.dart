import 'package:flutter/material.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/pages/alternative_edit/widgets/form_edit.dart';

import '../../models/tabungan.dart';

class AlternativeEditPage extends StatelessWidget {
  final Tabungan tabungan;
  const AlternativeEditPage({super.key, required this.tabungan});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Ubah Informasi Tabungan ${tabungan.data!.namaTabungan}",
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text("Masukkan sesuai dengan informasi tabungan"),
            const SizedBox(height: 10),
            FormEdit(tabungan: tabungan),
          ],
        ),
      ),
    );
  }
}
