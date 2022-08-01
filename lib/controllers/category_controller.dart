import 'package:tulsiresin/common/array/category.dart';
import 'package:tulsiresin/config.dart';

class CategoryController extends GetxController{
  TextEditingController txtSearch = TextEditingController();

  List categoryListData = [];

  searchList(val) {
   /* if(val.isEmpty){
      productList = [];
    }else {
      for (var i = 0; i < recentViewList.length; i++) {
        if (recentViewList[i].name!.contains(val)) {
          productList.add(recentViewList[i]);
        }
      }

    }*/
    update();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    categoryListData = category;
    update();
    super.onReady();
  }
}