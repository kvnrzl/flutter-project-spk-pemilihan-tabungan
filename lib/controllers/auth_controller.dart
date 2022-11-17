import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  final _isAuthenticated = false.obs;
  final _username = "".obs;

  bool get isAuthenticated => _isAuthenticated.value;
  set isAuthenticated(bool value) => _isAuthenticated.value = value;

  String get getUsername => _username.value;
  set setUsername(String value) => _username.value = value;

  // @override
  // void onInit() {
  //   super.onInit();
  //   ever(_isAuthenticated, (_) {
  //     if (isAuthenticated) {
  //       Get.offAllNamed('/home');
  //     } else {
  //       Get.offAllNamed('/login');
  //     }
  //   });
  // }

  void login() {
    isAuthenticated = true;
  }

  void logout() {
    isAuthenticated = false;
  }
}
