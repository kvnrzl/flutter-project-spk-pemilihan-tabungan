import 'package:flutter_project_spk_pemilihan_tabungan/services/auth_services.dart';
import 'package:get/get.dart';

import '../helpers/shared_preferences.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  final _isAuthenticated = false.obs;
  final _username = "Log In".obs;
  final _jwtToken = "".obs;

  // final int _loginTime = DateTime.now().millisecondsSinceEpoch;

  // @override
  // void onInit() {
  //   super.onInit();
  //   ever(_isAuthenticated, (_) {
  //     if (isAuthenticated && timeLogin() == 0) {
  //       logout();
  //     }
  //   });
  // }

  // @override
  // void onInit() {
  //   super.onInit();
  //   setUsername = SharedPref.getString("username") ?? "Log In";
  //   setJwtToken = SharedPref.getString("jwt-token") ?? "";
  //   isAuthenticated = SharedPref.getBool("is-authenticated") ?? false;
  // }

  bool get isAuthenticated => _isAuthenticated.value;
  set isAuthenticated(bool value) => _isAuthenticated.value = value;

  String get getUsername => _username.value;
  set setUsername(String value) => _username.value = value;

  String get getJwtToken => _jwtToken.value;
  set setJwtToken(String value) => _jwtToken.value = value;

  Future<void> login(String username, String password) async {
    await AuthServices.login(username, password).then((value) {
      _isAuthenticated.value = true;
      _username.value = value.data!.username!;
      _jwtToken.value = value.data!.token!;
      SharedPref.setBool("is-authenticated", true);
      SharedPref.setString("username", value.data!.username!);
      SharedPref.setString("jwt-token", value.data!.token!);

      // SharedPref.setInt("login-time", _loginTime);
    });
  }

  Future<void> logout() async {
    await AuthServices.logout().then((value) {
      _isAuthenticated.value = false;
      _username.value = "Log In";
      _jwtToken.value = "";
      SharedPref.setBool("is-authenticated", false);
      SharedPref.setString("username", "Log In");
      SharedPref.setString("jwt-token", "");

      // SharedPref.remove("login-time");
    });
  }

  // int timeLogin() {
  //   int today = DateTime.now().millisecondsSinceEpoch;
  //   int loginTimeHoursLater = DateTime.fromMillisecondsSinceEpoch(_loginTime)
  //       .add(const Duration(seconds: 20))
  //       .millisecondsSinceEpoch;
  //   return today.compareTo(loginTimeHoursLater);
  // }
}
