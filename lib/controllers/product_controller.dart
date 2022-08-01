import 'package:tulsiresin/config.dart';

class ProductController extends GetxController{
  bool isBack= false;

  @override
  void onReady() {
    // TODO: implement onReady
    isBack = Get.arguments ?? false;
    update();
    super.onReady();
  }
}