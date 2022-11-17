import 'package:flutter/material.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/pages/alternative/widgets/alternative_table.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/pages/alternative_add/alternative_add_page.dart';

import '../../models/tabungan.dart';
import '../../services/alternative_services.dart';

class AlternativePage extends StatefulWidget {
  const AlternativePage({super.key});

  @override
  State<AlternativePage> createState() => _AlternativePageState();
}

class _AlternativePageState extends State<AlternativePage> {
  ListTabungan? tabungans;

  Future<void> getListAllTabungan() async {
    tabungans = await AlternativeServices.getAllTabungan();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getListAllTabungan();
  }

  @override
  Widget build(BuildContext context) {
    // return AlternativeTable(tabungans: tabungans!);
    return tabungans != null
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AlternativeAddPage(),
                      ));
                },
                child: const Text("Tambah Tabungan"),
              ),
              Expanded(
                child: AlternativeTable(tabungans: tabungans!),
              ),
            ],
          )
        : const Center(child: Text("TIDAK ADA DAFTAR ALTERNATIF"));
  }
}
