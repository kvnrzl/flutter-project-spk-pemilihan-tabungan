import 'package:flutter/material.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/pages/recomendation/widgets/drop_down_preference_item.dart';
import 'package:get/get.dart';

import '../../../models/input_recomendation.dart';
import '../../preset/preset_page.dart';
import 'form_preference_item.dart';

class FormPreference extends StatefulWidget {
  const FormPreference({super.key});

  @override
  State<FormPreference> createState() => FormPreferenceState();
}

class FormPreferenceState extends State<FormPreference> {
  final _formKey = GlobalKey<FormState>();

  final setoranAwalController = TextEditingController();
  final setoranLanjutanController = TextEditingController();
  final saldoMinimumController = TextEditingController();
  final sukuBungaController = TextEditingController();
  final biayaAdminController = TextEditingController();
  final biayaPenarikanController = TextEditingController();

  final fungsiBisnisController = TextEditingController();
  final fungsiInvestasiController = TextEditingController();
  final fungsiTransaksionalController = TextEditingController();

  final kupDewasaController = TextEditingController();
  final kupRemajaController = TextEditingController();
  final kupAnakController = TextEditingController();

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
  void dispose() {
    setoranAwalController.dispose();
    setoranLanjutanController.dispose();
    saldoMinimumController.dispose();
    sukuBungaController.dispose();
    biayaAdminController.dispose();
    biayaPenarikanController.dispose();
    kupAnakController.dispose();
    kupRemajaController.dispose();
    kupDewasaController.dispose();
    fungsiTransaksionalController.dispose();
    fungsiInvestasiController.dispose();
    fungsiBisnisController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormPreferenceItem(
            controller: setoranAwalController,
            label: "Setoran Awal",
          ),
          FormPreferenceItem(
            controller: setoranLanjutanController,
            label: "Setoran Lanjutan Minimal",
          ),
          FormPreferenceItem(
            controller: saldoMinimumController,
            label: "Saldo Minimum",
          ),
          FormPreferenceItem(
            controller: sukuBungaController,
            label: "Suku Bunga",
            hint:
                "Isi dengan -1 jika ingin menggunakan kriteria bersifat benefit",
          ),
          FormPreferenceItem(
            controller: biayaAdminController,
            label: "Biaya Admin",
            hint: "Isi dengan -1 jika ingin menggunakan kriteria bersifat cost",
          ),
          FormPreferenceItem(
            controller: biayaPenarikanController,
            label: "Biaya Penarikan Habis",
            hint: "Isi dengan -1 jika ingin menggunakan kriteria bersifat cost",
          ),
          const SizedBox(height: 10),
          const Text("Fungsionalitas"),
          DropDownPreferenceItem(
            controller: fungsiBisnisController,
            label: "Bisnis",
          ),
          DropDownPreferenceItem(
            controller: fungsiInvestasiController,
            label: "Investasi",
          ),
          DropDownPreferenceItem(
            controller: fungsiTransaksionalController,
            label: "Transaksional",
          ),
          const SizedBox(height: 10),
          const Text("Kategori Umur Pengguna"),
          DropDownPreferenceItem(
            controller: kupDewasaController,
            label: "Dewasa",
          ),
          DropDownPreferenceItem(
            controller: kupRemajaController,
            label: "Remaja",
          ),
          DropDownPreferenceItem(
            controller: kupAnakController,
            label: "Anak-anak",
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   const SnackBar(content: Text('Processing Data')),
                    // );

                    Fungsionalitas fungsionalitas = Fungsionalitas(
                      bisnis: newParseToInt(fungsiBisnisController.text),
                      investasi: newParseToInt(fungsiInvestasiController.text),
                      transaksional:
                          newParseToInt(fungsiTransaksionalController.text),
                    );

                    KategoriUmurPengguna kategoriUmurPengguna =
                        KategoriUmurPengguna(
                      dewasa: newParseToInt(kupDewasaController.text),
                      remaja: newParseToInt(kupRemajaController.text),
                      anak: newParseToInt(kupAnakController.text),
                    );

                    NilaiIdeal nilaiIdeal = NilaiIdeal(
                      setoranAwal: newParseToInt(setoranAwalController.text),
                      setoranLanjutanMinimal:
                          newParseToInt(setoranLanjutanController.text),
                      saldoMinimum: newParseToInt(saldoMinimumController.text),
                      sukuBunga: newParseToDouble(sukuBungaController.text),
                      biayaAdmin: newParseToInt(biayaAdminController.text),
                      biayaPenarikanHabis:
                          newParseToInt(biayaPenarikanController.text),
                      fungsionalitas: fungsionalitas,
                      kategoriUmurPengguna: kategoriUmurPengguna,
                    );

                    debugPrint(nilaiIdeal.toJson().toString());

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PresetPage(isPreset: false, nilaiIdeal: nilaiIdeal),
                      ),
                    );
                  }
                },
                child: const Text('Next'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
