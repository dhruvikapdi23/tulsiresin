import 'package:flutter/foundation.dart';
import 'package:tulsiresin/config.dart';
import 'package:tulsiresin/mixins/shopify_mixin.dart';

import '../models/user.dart';

class SignupController extends GetxController with ShopifyMixin{
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtFirstName = TextEditingController();
  TextEditingController txtLastName = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  final signupFormKey = GlobalKey<FormState>();
  bool isCheck= false;


  List<User> userList = [];
  var formKey = GlobalKey<FormState>();

  void checkLogin() async {
    User data = await shopifyService.createUser(
      firstName: txtFirstName.text,
      lastName: txtLastName.text,
      email: txtEmail.text,
      password: txtPassword.text,
    );
    userList.add(data);

    txtFirstName.clear();
    txtLastName.clear();
    txtEmail.clear();
    txtPassword.clear();
    update();
    Get.back();
  }

}