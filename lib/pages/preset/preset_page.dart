import 'package:flutter/material.dart';

import '../../models/input_recomendation.dart';
import 'widgets/form_preset.dart';

class PresetPage extends StatelessWidget {
  final bool? isPreset;
  final NilaiIdeal? nilaiIdeal;
  const PresetPage({super.key, this.isPreset = true, this.nilaiIdeal});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          // FormPreference(),
          FormPreset(
            isPreset: isPreset!,
            nilaiIdeal: nilaiIdeal,
          ),
        ],
      ),
    );
  }
}
