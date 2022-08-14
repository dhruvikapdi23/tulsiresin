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
  printLog("useruser : $user");
    storage.write(Session.userInfo, user);
    txtEmail.clear();
    txtPassword.clear();

    update();
    Get.toNamed(routeName.dashboard);
  }
}
