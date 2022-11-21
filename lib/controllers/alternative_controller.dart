import 'package:flutter_project_spk_pemilihan_tabungan/models/tabungan.dart';
import 'package:get/get.dart';

import '../services/alternative_services.dart';

class AlternativeController extends GetxController {
  static AlternativeController instance = Get.find();

  final _tabungans = ListTabungan().obs;

  @override
  onInit() {
    super.onInit();
    onLoadAlternative();
  }

  ListTabungan get tabungans => _tabungans.value;

  Future<void> onLoadAlternative() async {
    _tabungans.value = await AlternativeServices.getAllTabungan();
  }

  Future<void> onDeleteAlternative(int id) async {
    await AlternativeServices.deleteTabungan(id: id);
    onLoadAlternative();
  }
}
