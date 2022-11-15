import 'package:flutter/material.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/services/user.dart';

import '../../../models/result.dart';
import '../../../models/tabungan.dart';

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

  Result? result;

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
          TextFormFieldPreference(
            controller: setoranAwalController,
            label: "Setoran Awal",
          ),
          TextFormFieldPreference(
            controller: setoranLanjutanController,
            label: "Setoran Lanjutan Minimal",
          ),
          TextFormFieldPreference(
            controller: saldoMinimumController,
            label: "Saldo Minimum",
          ),
          TextFormFieldPreference(
            controller: sukuBungaController,
            label: "Suku Bunga",
          ),
          TextFormFieldPreference(
            controller: biayaAdminController,
            label: "Biaya Admin",
          ),
          TextFormFieldPreference(
            controller: biayaPenarikanController,
            label: "Biaya Penarikan Habis",
          ),
          const SizedBox(height: 10),
          const Text("Fungsionalitas"),
          TextFormFieldPreference(
            controller: fungsiBisnisController,
            label: "Bisnis",
          ),
          TextFormFieldPreference(
            controller: fungsiInvestasiController,
            label: "Investasi",
          ),
          TextFormFieldPreference(
            controller: fungsiTransaksionalController,
            label: "Transaksional",
          ),
          const SizedBox(height: 10),
          const Text("Kategori Umur Pengguna"),
          TextFormFieldPreference(
            controller: kupDewasaController,
            label: "Dewasa",
          ),
          TextFormFieldPreference(
            controller: kupRemajaController,
            label: "Remaja",
          ),
          TextFormFieldPreference(
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

                  Tabungan tabungan = Tabungan(
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

                  result = await UserServices.hitungResult(tabungan: tabungan);

                  if (result != null) {
                    debugPrint("RESULT : ${result!.toJson()}");
                    // Navigator.pushNamed(context, '/result', arguments: result);
                  }
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

class TextFormFieldPreference extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  const TextFormFieldPreference({
    Key? key,
    required this.controller,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10, top: 5),
      height: 36,
      width: MediaQuery.of(context).size.width / 2,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          label: Text(label),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          hintText: label == "Bisnis"
              ? "1 - 5"
              : label == "Investasi"
                  ? "1 - 5"
                  : label == "Transaksional"
                      ? "1 - 5"
                      : label == "Dewasa"
                          ? "1 - 5"
                          : label == "Remaja"
                              ? "1 - 5"
                              : label == "Anak-anak"
                                  ? "1 - 5"
                                  : label,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      ),
    );
  }
}
