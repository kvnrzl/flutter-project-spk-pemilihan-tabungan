import 'package:flutter/material.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/pages/success/edit_success.dart';
import 'package:get/get.dart';
import '../../../constants/controller.dart';
import '../../../models/input_recomendation.dart';
import '../../../services/preset_services.dart';
import '../../../services/recomendation_services.dart';
import '../../result/result_page.dart';
import 'form_preset_item.dart';

class FormPreset extends StatefulWidget {
  final bool isPreset;
  final NilaiIdeal? nilaiIdeal;
  const FormPreset({super.key, required this.isPreset, this.nilaiIdeal});

  @override
  State<FormPreset> createState() => _FormPresetState();
}

class _FormPresetState extends State<FormPreset> {
  final _formKey = GlobalKey<FormState>();

  final setoranAwalController = TextEditingController();
  final setoranLanjutanController = TextEditingController();
  final saldoMinimumController = TextEditingController();
  final sukuBungaController = TextEditingController();
  final biayaAdminController = TextEditingController();
  final biayaPenarikanController = TextEditingController();
  final fungsionalitasController = TextEditingController();
  final kupController = TextEditingController();

  void getPresetBobot() async {
    await PresetServices.getPresetBobot().then((value) {
      setState(() {
        setoranAwalController.text = value.data!.setoranAwal.toString();
        setoranLanjutanController.text =
            value.data!.setoranLanjutanMinimal.toString();
        saldoMinimumController.text = value.data!.saldoMinimum.toString();
        sukuBungaController.text = value.data!.sukuBunga.toString();
        biayaAdminController.text = value.data!.biayaAdmin.toString();
        biayaPenarikanController.text =
            value.data!.biayaPenarikanHabis.toString();
        fungsionalitasController.text = value.data!.fungsionalitas.toString();
        kupController.text = value.data!.kategoriUmurPengguna.toString();
      });
    });
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
    getPresetBobot();
  }

  @override
  void dispose() {
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

  Future<void> usedToSetBobot(PresetKriteria presetKriteria) async {
    await PresetServices.updatePresetBobot(presetKriteria: presetKriteria)
        .then((_) {
      return Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SuccessPage(
              message: "Preset bobot kriteria berhasil diupdate."),
        ),
      );
    });
  }

  Future<void> usedToGetRecomendation(
    InputRecomendation inputRecomendation,
  ) async {
    await RecomendationServices.hitungResult(
            inputRecomendation: inputRecomendation)
        .then((value) {
      Get.snackbar("Success", "Rekomendasi berhasil dihitung",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      return Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(
            result: value,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormPresetItem(
            controller: setoranAwalController,
            label: "Setoran Awal",
          ),
          FormPresetItem(
            controller: setoranLanjutanController,
            label: "Setoran Lanjutan Minimal",
          ),
          FormPresetItem(
            controller: saldoMinimumController,
            label: "Saldo Minimum",
          ),
          FormPresetItem(
            controller: sukuBungaController,
            label: "Suku Bunga",
          ),
          FormPresetItem(
            controller: biayaAdminController,
            label: "Biaya Admin",
          ),
          FormPresetItem(
            controller: biayaPenarikanController,
            label: "Biaya Penarikan Habis",
          ),
          FormPresetItem(
            controller: fungsionalitasController,
            label: "Fungsionalitas",
          ),
          FormPresetItem(
            controller: kupController,
            label: "Kategori Umur Pengguna",
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () async {
                  var parseSetoranAwal =
                      newParseToDouble(setoranAwalController.text);
                  var parseSetoranLanjutanMinimal =
                      newParseToDouble(setoranLanjutanController.text);
                  var parseSaldoMinimum =
                      newParseToDouble(saldoMinimumController.text);
                  var parseSukuBunga =
                      newParseToDouble(sukuBungaController.text);
                  var parseFungsionalitas =
                      newParseToDouble(fungsionalitasController.text);
                  var parseBiayaAdmin =
                      newParseToDouble(biayaAdminController.text);
                  var parseBiayaPenarikanHabis =
                      newParseToDouble(biayaPenarikanController.text);
                  var parseKategoriUmurPengguna =
                      newParseToDouble(kupController.text);

                  var totalBobot = parseSetoranAwal +
                      parseSetoranLanjutanMinimal +
                      parseSaldoMinimum +
                      parseSukuBunga +
                      parseFungsionalitas +
                      parseBiayaAdmin +
                      parseBiayaPenarikanHabis +
                      parseKategoriUmurPengguna;

                  if (_formKey.currentState!.validate()) {
                    if (totalBobot != 1) {
                      return Get.defaultDialog(
                        title: "Peringatan",
                        middleText: "Total bobot kriteria harus sama dengan 1",
                        textConfirm: "Ya",
                        confirmTextColor: Colors.white,
                        buttonColor: Colors.blue,
                        onConfirm: () {
                          Get.back();
                        },
                      );
                    }

                    PresetKriteria presetKriteria = PresetKriteria(
                      setoranAwal: parseSetoranAwal,
                      setoranLanjutanMinimal: parseSetoranLanjutanMinimal,
                      saldoMinimum: parseSaldoMinimum,
                      sukuBunga: parseSukuBunga,
                      fungsionalitas: parseFungsionalitas,
                      biayaAdmin: parseBiayaAdmin,
                      biayaPenarikanHabis: parseBiayaPenarikanHabis,
                      kategoriUmurPengguna: parseKategoriUmurPengguna,
                    );

                    InputRecomendation inputRecomendation = InputRecomendation(
                      nilaiIdeal: widget.nilaiIdeal,
                      presetKriteria: presetKriteria,
                    );

                    if (widget.isPreset) {
                      if (!authController.isAuthenticated) {
                        Get.snackbar("Error",
                            "Anda tidak memiliki akses untuk mengubah preset bobot kriteria",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.red,
                            colorText: Colors.white);
                        return;
                      }
                      usedToSetBobot(presetKriteria);
                    } else {
                      usedToGetRecomendation(inputRecomendation);
                    }
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
