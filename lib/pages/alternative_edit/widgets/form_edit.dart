import 'package:flutter/material.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/pages/success/edit_success.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/services/alternative_services.dart';
import 'package:get/get.dart';

import '../../../constants/controller.dart';
import '../../../models/tabungan.dart';
import 'drop_down_edit_item.dart';
import 'form_edit_item.dart';

class FormEdit extends StatefulWidget {
  final Tabungan tabungan;
  const FormEdit({super.key, required this.tabungan});

  @override
  State<FormEdit> createState() => _FormEditState();
}

class _FormEditState extends State<FormEdit> {
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

  newParseToInt(String source) {
    var a = int.tryParse(source);
    if (a is int) {
      return a;
    } else {
      return Get.snackbar("Error", "Inputan tidak sesuai",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  newParseToDouble(String source) {
    var a = double.tryParse(source);
    if (a is double) {
      return a;
    } else {
      return Get.snackbar("Error", "Inputan tidak sesuai",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  void initState() {
    super.initState();
    namaTabunganController.text = widget.tabungan.data!.namaTabungan!;
    setoranAwalController.text = widget.tabungan.data!.setoranAwal.toString();
    setoranLanjutanController.text =
        widget.tabungan.data!.setoranLanjutanMinimal.toString();
    saldoMinimumController.text = widget.tabungan.data!.saldoMinimum.toString();
    sukuBungaController.text = widget.tabungan.data!.sukuBunga.toString();
    biayaAdminController.text = widget.tabungan.data!.biayaAdmin.toString();
    biayaPenarikanController.text =
        widget.tabungan.data!.biayaPenarikanHabis.toString();
    fungsionalitasController.text = widget.tabungan.data!.fungsionalitas!;
    kupController.text = widget.tabungan.data!.kategoriUmurPengguna!;
  }

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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormEditItem(
            controller: namaTabunganController,
            label: "Nama Tabungan",
          ),
          FormEditItem(
            controller: setoranAwalController,
            label: "Setoran Awal",
          ),
          FormEditItem(
            controller: setoranLanjutanController,
            label: "Setoran Lanjutan Minimal",
          ),
          FormEditItem(
            controller: saldoMinimumController,
            label: "Saldo Minimum",
          ),
          FormEditItem(
            controller: sukuBungaController,
            label: "Suku Bunga",
          ),
          FormEditItem(
            controller: biayaAdminController,
            label: "Biaya Admin",
          ),
          FormEditItem(
            controller: biayaPenarikanController,
            label: "Biaya Penarikan Habis",
          ),
          DropDownEditItem(
            label: "Fungsionalitas",
            items: fungsionalitasMenu,
            itemValue: fungsionalitasController,
          ),
          DropDownEditItem(
            label: "Kategori Umur Pengguna",
            items: kupMenu,
            itemValue: kupController,
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () async {
                  if (!authController.isAuthenticated) {
                    Get.snackbar("Error",
                        "Anda tidak memiliki akses untuk mengedit data",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white);
                    return;
                  }

                  if (_formKey.currentState!.validate()) {
                    await AlternativeServices.updateTabungan(
                      id: widget.tabungan.data!.id!,
                      namaTabungan: namaTabunganController.text,
                      setoranAwal: newParseToInt(setoranAwalController.text),
                      setoranLanjutanMinimal:
                          newParseToInt(setoranLanjutanController.text),
                      saldoMinimum: newParseToInt(saldoMinimumController.text),
                      sukuBunga: newParseToDouble(sukuBungaController.text),
                      fungsionalitas: fungsionalitasController.text,
                      biayaAdmin: newParseToInt(biayaAdminController.text),
                      biayaPenarikanHabis:
                          newParseToInt(biayaPenarikanController.text),
                      kategoriUmurPengguna: kupController.text,
                    ).then((_) {
                      return Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SuccessPage(
                              message:
                                  "Alternatif tabungan berhasil diupdate."),
                        ),
                      );
                    });
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
