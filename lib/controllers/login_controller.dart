import 'package:flutter/foundation.dart';
import 'package:tulsiresin/config.dart';

class LoginController extends GetxController {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool passwordVisible = true;
  final formKey = GlobalKey<FormState>();

  // Toggle Between Password show
  void toggle() {
    passwordVisible = !passwordVisible;
    update();
  }

  checkLogin() {
    print('check');
    Get.toNamed(routeName.dashboard);
  }
}
