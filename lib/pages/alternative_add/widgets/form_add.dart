import 'package:flutter/material.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/pages/success/edit_success.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/services/alternative_services.dart';
import 'package:get/get.dart';

import '../../../constants/controller.dart';
import 'drop_down_add_item.dart';
import 'form_add_item.dart';

class FormAdd extends StatefulWidget {
  const FormAdd({super.key});

  @override
  State<FormAdd> createState() => _FormAddState();
}

class _FormAddState extends State<FormAdd> {
  final _formKey = GlobalKey<FormState>();

  final namaTabunganController = TextEditingController();
  final setoranAwalController = TextEditingController();
  final setoranLanjutanController = TextEditingController();
  final saldoMinimumController = TextEditingController();
  final sukuBungaController = TextEditingController();
  final biayaAdminController = TextEditingController();
  final biayaPenarikanController = TextEditingController();
  final fungsionalitasController = TextEditingController();
  final kupController = TextEditingController();

  @override
  void dispose() {
    namaTabunganController.dispose();
    setoranAwalController.dispose();
    setoranLanjutanController.dispose();
    saldoMinimumController.dispose();
    sukuBungaController.dispose();
    biayaAdminController.dispose();
    biayaPenarikanController.dispose();
    fungsionalitasController.dispose();
    kupController.dispose();
    super.dispose();
  }

  List<DropdownMenuItem> fungsionalitasMenu = const [
    DropdownMenuItem(value: "BISNIS", child: Text("BISNIS")),
    DropdownMenuItem(value: "INVESTASI", child: Text("INVESTASI")),
    DropdownMenuItem(value: "TRANSAKSIONAL", child: Text("TRANSAKSIONAL")),
  ];

  List<DropdownMenuItem> kupMenu = const [
    DropdownMenuItem(value: "DEWASA", child: Text("DEWASA")),
    DropdownMenuItem(value: "REMAJA", child: Text("REMAJA")),
    DropdownMenuItem(value: "ANAK-ANAK", child: Text("ANAK-ANAK")),
  ];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormAddItem(
            controller: namaTabunganController,
            label: "Nama Tabungan",
          ),
          FormAddItem(
            controller: setoranAwalController,
            label: "Setoran Awal",
          ),
          FormAddItem(
            controller: setoranLanjutanController,
            label: "Setoran Lanjutan Minimal",
          ),
          FormAddItem(
            controller: saldoMinimumController,
            label: "Saldo Minimum",
          ),
          FormAddItem(
            controller: sukuBungaController,
            label: "Suku Bunga",
          ),
          FormAddItem(
            controller: biayaAdminController,
            label: "Biaya Admin",
          ),
          FormAddItem(
            controller: biayaPenarikanController,
            label: "Biaya Penarikan Habis",
          ),
          DropDownAddItem(
            label: "Fungsionalitas",
            items: fungsionalitasMenu,
            itemValue: fungsionalitasController,
          ),
          DropDownAddItem(
            label: "Kategori Umur Pengguna",
            items: kupMenu,
            itemValue: kupController,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () async {
                if (!authController.isAuthenticated) {
                  Get.snackbar(
                      "Error", "Anda tidak memiliki akses untuk menambah data",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red,
                      colorText: Colors.white);
                  return;
                }
                if (_formKey.currentState!.validate()) {
                  await AlternativeServices.createTabungan(
                    namaTabungan: namaTabunganController.text,
                    setoranAwal: int.parse(setoranAwalController.text),
                    setoranLanjutanMinimal:
                        int.parse(setoranLanjutanController.text),
                    saldoMinimum: int.parse(saldoMinimumController.text),
                    sukuBunga: double.parse(sukuBungaController.text),
                    fungsionalitas: fungsionalitasController.text,
                    biayaAdmin: int.parse(biayaAdminController.text),
                    biayaPenarikanHabis:
                        int.parse(biayaPenarikanController.text),
                    kategoriUmurPengguna: kupController.text,
                  ).then((_) {
                    return Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SuccessPage(
                            message:
                                "Alternatif tabungan berhasil ditambahkan"),
                      ),
                    );
                  });
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
