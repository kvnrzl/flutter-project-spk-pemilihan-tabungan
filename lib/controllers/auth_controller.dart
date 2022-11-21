import 'package:flutter_project_spk_pemilihan_tabungan/services/auth_services.dart';
import 'package:get/get.dart';

import '../models/admin.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  final _isAuthenticated = false.obs;
  final _username = "Log In".obs;

  // @override
  // void onInit() {
  //   super.onInit();
  //   ever(_isAuthenticated, (_) {
  //     if (isAuthenticated) {
  //       Get.offAllNamed('/');
  //     } else {
  //       Get.offAllNamed('/login');
  //     }
  //   });
  // }

  bool get isAuthenticated => _isAuthenticated.value;
  set isAuthenticated(bool value) => _isAuthenticated.value = value;

  String get getUsername => _username.value;
  set setUsername(String value) => _username.value = value;

  Future<Admin> login(String username, String password) async {
    isAuthenticated = true;
    return AuthServices.login(username, password);
  }

  Future<void> logout() async {
    isAuthenticated = false;
    await AuthServices.logout();
  }
}
