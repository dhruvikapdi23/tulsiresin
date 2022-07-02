import 'package:flutter/foundation.dart';
import 'package:tulsiresin/config.dart';

class SignupController extends GetxController{
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtFirstName = TextEditingController();
  TextEditingController txtLastName = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  final signupFormKey = GlobalKey<FormState>();
  bool isCheck= false;



  checkLogin(){
    if (kDebugMode) {
      print('done');
    }
  }
}