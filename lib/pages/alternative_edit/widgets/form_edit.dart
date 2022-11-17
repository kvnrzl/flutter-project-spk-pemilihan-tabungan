import 'package:flutter/material.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/pages/success/edit_success.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/services/alternative_services.dart';

import '../../../models/tabungan.dart';
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
          // const SizedBox(height: 10),
          // const Text("Fungsionalitas"),
          FormEditItem(
            controller: fungsionalitasController,
            label: "Fungsionalitas",
            hint: "Bisnis / Investasi / Transaksional",
          ),
          // FormEditItem(
          //   controller: fungsiInvestasiController,
          //   label: "Investasi",
          // ),
          // FormEditItem(
          //   controller: fungsiTransaksionalController,
          //   label: "Transaksional",
          // ),
          // const SizedBox(height: 10),
          // const Text("Kategori Umur Pengguna"),
          FormEditItem(
            controller: kupController,
            label: "Kategori Umur Pengguna",
            hint: "Dewasa / Remaja / Anak-anak",
          ),
          // FormEditItem(
          //   controller: kupRemajaController,
          //   label: "Remaja",
          // ),
          // FormEditItem(
          //   controller: kupAnakController,
          //   label: "Anak-anak",
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );

                  // Fungsionalitas fungsionalitas = Fungsionalitas(
                  //   bisnis: int.tryParse(fungsiBisnisController.text) ?? 0,
                  //   investasi:
                  //       int.tryParse(fungsiInvestasiController.text) ?? 0,
                  //   transaksional:
                  //       int.tryParse(fungsiTransaksionalController.text) ?? 0,
                  // );

                  // KategoriUmurPengguna kategoriUmurPengguna =
                  //     KategoriUmurPengguna(
                  //   dewasa: int.tryParse(kupDewasaController.text) ?? 0,
                  //   remaja: int.tryParse(kupRemajaController.text) ?? 0,
                  //   anak: int.tryParse(kupAnakController.text) ?? 0,
                  // );

                  // InputRecomendation inputRecomendation = InputRecomendation(
                  //   setoranAwal: int.tryParse(setoranAwalController.text) ?? 0,
                  //   setoranLanjutanMinimal:
                  //       int.tryParse(setoranLanjutanController.text) ?? 0,
                  //   saldoMinimum:
                  //       int.tryParse(saldoMinimumController.text) ?? 0,
                  //   sukuBunga: double.tryParse(sukuBungaController.text) ?? 0,
                  //   biayaAdmin: int.tryParse(biayaAdminController.text) ?? 0,
                  //   biayaPenarikanHabis:
                  //       int.tryParse(biayaPenarikanController.text) ?? 0,
                  //   fungsionalitas: fungsionalitas,
                  //   kategoriUmurPengguna: kategoriUmurPengguna,
                  // );

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

                  // if (result != null) {
                  //   debugPrint("RESULT : ${result!.toJson()}");
                  //   Navigator.pushNamed(context, '/result', arguments: result);
                  //   // Navigator.pushNamed(context, '/result', arguments: result);
                  // }
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
