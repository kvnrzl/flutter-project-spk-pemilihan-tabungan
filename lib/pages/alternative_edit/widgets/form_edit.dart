import 'package:flutter/material.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/pages/success/edit_success.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/services/alternative_services.dart';

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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );

                  await AlternativeServices.updateTabungan(
                    id: widget.tabungan.data!.id!,
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
                            message: "Alternatif tabungan berhasil diubah"),
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
