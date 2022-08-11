
import 'package:tulsiresin/common/array/product.dart';
import 'package:tulsiresin/config.dart';
import 'package:tulsiresin/models/product.dart';

class SearchController extends GetxController {
  TextEditingController txtSearch = TextEditingController();
  bool isBack= false;
  List<ProductModel> productList = [];

  searchList(val) {
    if(val.isEmpty){
      productList = [];
    }else {
      for (var i = 0; i < getProducts.length; i++) {
        if (getProducts[i].title!.contains(val)) {
          productList.add(getProducts[i]);
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
