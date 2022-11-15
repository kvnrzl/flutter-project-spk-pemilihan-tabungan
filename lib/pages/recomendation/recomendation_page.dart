import 'package:flutter/material.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/pages/recomendation/widgets/form_preference.dart';

class RecomendationPage extends StatelessWidget {
  const RecomendationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const [
            Text(
              "Input Nilai Preferensi",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("Masukkan nilai sesuai kebutuhan pengguna"),
            SizedBox(height: 10),
            FormPreference(),
          ],
        ),
      ),
    );
  }
}
