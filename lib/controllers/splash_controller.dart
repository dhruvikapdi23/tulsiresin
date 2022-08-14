import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tulsiresin/models/user.dart';

import '../config.dart';

class SplashController extends GetxController {
  bool positionAnimation = false;
  bool showLoading = false;
  double appTitleOpacity = 0;
  User? user;
  final storage = GetStorage();

  @override
  void onInit() {
    ///Remove catch images
    try {
      if ((env['catchClearOnSplash'] ?? true) == true) {
        DefaultCacheManager().emptyCache().then((value) {});
      }
    } on Exception catch (e) {
      printLog(e);
    }
    super.onInit();
  }

  @override
  void onReady() async {
    positionAnimation = true;
    update();
    await Future.delayed(Durations.slower);

    setLanguage();
    checkLogin();

    super.onReady();
  }

  void animateLoading() {
    showLoading = true;
    update();
  }

  void showLabel() {
    appTitleOpacity = 1;
    update();
  }

  void setLanguage() {
    String? languageCode = appCtrl.getStorage.read(Session.languageCode);
    String? countryCode = appCtrl.getStorage.read(Session.countryCode);

    if (languageCode != null && countryCode != null) {
      var locale = Locale(languageCode, countryCode);
      Get.updateLocale(locale);
    } else {
      Get.updateLocale(Get.deviceLocale!);

      writeStorage(Session.languageCode, Get.deviceLocale!.languageCode);
      writeStorage(Session.countryCode, Get.deviceLocale!.countryCode);
    }
  }

  bool isLogin() {
    String? authToken = getStorage(Session.authToken);
    bool? stayLogin = getStorage(Session.stayLogin) ?? false;
    var user = storage.read(Session.userInfo) ?? "";
    var id = getStorage(Session.id);

    if (authToken != null && user != null && user != "") {
      return true;
    } else {
      return false;
    }
  }

  void checkLogin() async {
    bool isOnboarded = getStorage(Session.isOnboarded) ?? false;
    if (isLogin()) {
      Get.offAndToNamed(routeName.dashboard);
    } else if (isOnboarded == false) {
      Get.offAndToNamed(routeName.login);
    } else {
      Get.offAndToNamed(routeName.login);
    }
  }
}
