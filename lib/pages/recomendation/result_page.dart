import "package:flutter/material.dart";
import 'package:flutter_project_spk_pemilihan_tabungan/pages/recomendation/widgets/result_table.dart';

import '../../models/result.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final result = ModalRoute.of(context)!.settings.arguments as Result;
    // debugPrint("isi dari result pada result page : ${result.toJson()}");

    return Scaffold(
      body: ResultTable(result: result),
    );

    // return Container(
    //   padding: const EdgeInsets.all(20),
    //   child: Column(
    //     children: const [
    //       Text(
    //         "Hasil Rekomendasi",
    //         style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    //       ),
    //       SizedBox(height: 10),
    //       Text("Hasil sesuai kebutuhan dari input pengguna"),
    //       SizedBox(height: 10),
    //       // TableResult(),
    //     ],
    //   ),
    // );
  }
}
