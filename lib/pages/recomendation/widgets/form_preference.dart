import 'package:flutter/material.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/services/recomendation_services.dart';

import '../../../models/input_recomendation.dart';
import '../../result/result_page.dart';
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
          ),
          FormPreferenceItem(
            controller: biayaAdminController,
            label: "Biaya Admin",
          ),
          FormPreferenceItem(
            controller: biayaPenarikanController,
            label: "Biaya Penarikan Habis",
          ),
          const SizedBox(height: 10),
          const Text("Fungsionalitas"),
          FormPreferenceItem(
            controller: fungsiBisnisController,
            label: "Bisnis",
          ),
          FormPreferenceItem(
            controller: fungsiInvestasiController,
            label: "Investasi",
          ),
          FormPreferenceItem(
            controller: fungsiTransaksionalController,
            label: "Transaksional",
          ),
          const SizedBox(height: 10),
          const Text("Kategori Umur Pengguna"),
          FormPreferenceItem(
            controller: kupDewasaController,
            label: "Dewasa",
          ),
          FormPreferenceItem(
            controller: kupRemajaController,
            label: "Remaja",
          ),
          FormPreferenceItem(
            controller: kupAnakController,
            label: "Anak-anak",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );

                  Fungsionalitas fungsionalitas = Fungsionalitas(
                    bisnis: int.tryParse(fungsiBisnisController.text) ?? 0,
                    investasi:
                        int.tryParse(fungsiInvestasiController.text) ?? 0,
                    transaksional:
                        int.tryParse(fungsiTransaksionalController.text) ?? 0,
                  );

                  KategoriUmurPengguna kategoriUmurPengguna =
                      KategoriUmurPengguna(
                    dewasa: int.tryParse(kupDewasaController.text) ?? 0,
                    remaja: int.tryParse(kupRemajaController.text) ?? 0,
                    anak: int.tryParse(kupAnakController.text) ?? 0,
                  );

                  InputRecomendation inputRecomendation = InputRecomendation(
                    setoranAwal: int.tryParse(setoranAwalController.text) ?? 0,
                    setoranLanjutanMinimal:
                        int.tryParse(setoranLanjutanController.text) ?? 0,
                    saldoMinimum:
                        int.tryParse(saldoMinimumController.text) ?? 0,
                    sukuBunga: double.tryParse(sukuBungaController.text) ?? 0,
                    biayaAdmin: int.tryParse(biayaAdminController.text) ?? 0,
                    biayaPenarikanHabis:
                        int.tryParse(biayaPenarikanController.text) ?? 0,
                    fungsionalitas: fungsionalitas,
                    kategoriUmurPengguna: kategoriUmurPengguna,
                  );

                  await RecomendationServices.hitungResult(
                          inputRecomendation: inputRecomendation)
                      .then((value) {
                    return Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(
                          result: value,
                        ),
                      ),
                    );
                    // return Navigator.pushNamed(context, '/result',
                    //     arguments: value);
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
