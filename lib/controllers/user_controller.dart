import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tulsiresin/config.dart';
import 'package:tulsiresin/mixins/shopify_mixin.dart';

import '../models/user.dart';
import '../views/user/widgets/language_bottom_sheet.dart';

class UserController extends GetxController with ShopifyMixin {
  final storage = GetStorage();

//logout
  logout() async {
    storage.erase();
    Get.offAllNamed(routeName.login);
  }

  //languageSheet
  languageSheet() {
    Get.bottomSheet(
      const LanguageBottomSheet(),
    );
  }
}
