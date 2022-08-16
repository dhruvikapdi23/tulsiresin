import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tulsiresin/config.dart';
import 'package:tulsiresin/mixins/shopify_mixin.dart';

import '../models/user.dart';

class LoginController extends GetxController with ShopifyMixin {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool passwordVisible = true;
  final formKey = GlobalKey<FormState>();
  final storage = GetStorage();

  // Toggle Between Password show
  void toggle() {
    passwordVisible = !passwordVisible;
    update();
  }

  User? user;

  void checkLogin() async {
    user = await shopifyService.login(
      username: txtEmail.text,
      password: txtPassword.text,
    );
    if (user != null) {
      printLog("useruser : $user");
      storage.write(Session.userInfo, user);
      txtEmail.clear();
      txtPassword.clear();

      update();
      Get.toNamed(routeName.dashboard);
    }else{
      Get.snackbar(
        "Alert",
        "Invalid Credentials",
        snackPosition: SnackPosition.TOP,
        backgroundColor: appCtrl.appTheme.primary,
        borderRadius: 0,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,

      );
    }
  }
}
