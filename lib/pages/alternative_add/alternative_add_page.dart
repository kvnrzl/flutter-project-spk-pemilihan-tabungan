import 'package:flutter/material.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/pages/alternative_add/widgets/form_add.dart';

class AlternativeAddPage extends StatelessWidget {
  const AlternativeAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const [
            Text(
              "Tambah Alternatif Tabungan",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("Masukkan nilai sesuai dengan informasi tabungan"),
            SizedBox(height: 10),
            FormAdd(),
          ],
        ),
      ),
    );
  }
}
