import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.center,
            child: Text(
              "Sistem Pendukung Keputusan\nProduk Tabungan Bank BTN",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 50),
            margin: const EdgeInsets.symmetric(horizontal: 150),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "SPK ini dapat digunakan untuk membantu calon nasabah dalam pemilihan jenis produk tabungan yang sesuai dengan kebutuhan dan preferensi.\nMetode yang digunakan adalah kombinasi dari metode Profile Matching (PM) dan Simple Additive Weighting (SAW).",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                Text(
                  "Manfaat:\n\t1. Bagi calon nasabah, dapat menentukan jenis tabungan yang dipilih sesuai dengan kebutuhan dan preferensi.\n\t2. Bagi bank, dapat meyakinkan calon nasabah dalam memberikan rekomendasi jenis produk tabungan dan mengurangi potensi rekening tabungan pasif (dormant).",
                  style: TextStyle(fontSize: 18),
                ),
                // SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
