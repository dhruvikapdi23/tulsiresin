
import 'package:tulsiresin/config.dart';

class SearchController extends GetxController {
  TextEditingController txtSearch = TextEditingController();
  bool isBack= false;
  List<ProductViewModel> productList = [];

  searchList(val) {
    if(val.isEmpty){
      productList = [];
    }else {
      for (var i = 0; i < recentViewList.length; i++) {
        if (recentViewList[i].name!.contains(val)) {
          productList.add(recentViewList[i]);
        }
      }

    }
    update();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    isBack = Get.arguments ?? false;
    update();
    super.onReady();
  }
}
