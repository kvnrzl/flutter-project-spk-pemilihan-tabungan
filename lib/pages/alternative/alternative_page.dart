import 'package:flutter/material.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/constants/controller.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/pages/alternative/widgets/alternative_table.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/pages/alternative_add/alternative_add_page.dart';
import 'package:get/get.dart';

import '../../models/tabungan.dart';

class AlternativePage extends StatefulWidget {
  const AlternativePage({super.key});

  @override
  State<AlternativePage> createState() => _AlternativePageState();
}

class _AlternativePageState extends State<AlternativePage> {
  // ListTabungan? tabungans;

  // Future<void> getListAllTabungan() async {
  //   tabungans = await AlternativeServices.getAllTabungan();
  //   setState(() {});
  // }

  @override
  void initState() {
    super.initState();
    // getListAllTabungan();
    alternativeController.onLoadAlternative();
  }

  @override
  Widget build(BuildContext context) {
    // return AlternativeTable(tabungans: tabungans!);
    // return tabungans != null
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Daftar Alternatif Tabungan",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Text(
              "Hanya admin yang dapat menambah, mengubah, dan menghapus daftar alternatif"),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 50),
            child: Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () async {
                  String value = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AlternativeAddPage(),
                      ));
                  debugPrint("INI ISI VALUE : $value");
                  if (value == 'OK') {
                    // await getListAllTabungan();
                  }
                },
                child: const Text("Tambah Alternatif"),
              ),
            ),
          ),
          Expanded(
            child: AlternativeTable(
              tabungans: alternativeController.tabungans,
            ),
          ),
        ],
      ),
    );
    // : const Center(child: Text("TIDAK ADA DAFTAR ALTERNATIF"));
  }
}
