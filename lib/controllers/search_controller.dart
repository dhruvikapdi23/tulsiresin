import 'package:tulsiresin/app_services/config.dart';
import 'package:tulsiresin/common/array/product.dart';
import 'package:tulsiresin/config.dart';
import 'package:tulsiresin/mixins/shopify_mixin.dart';
import 'package:tulsiresin/models/product.dart';

class SearchController extends GetxController with ShopifyMixin {
  TextEditingController txtSearch = TextEditingController();
  bool isBack = false;
  List<ProductModel> productList = [];
  List<ProductModel> searchListData = [];
  List collections = config['home']['collections'] ?? [];
  
  searchList(val) async{

    if (val.isEmpty) {
      searchListData = [];
      update();
    } else {


      productList = await getProductDataByCollectionId(collections[0]['category'], val);
      for (var i = 0; i < productList.length; i++) {
        if (productList[i].title!.contains(val)) {
          searchListData.add(productList[i]);
        }
      }
    }
    update();
  }

  Future<List<ProductModel>> getProductDataByCollectionId(
      String categoryId,search) async {

    try {
      List<ProductModel> data = await shopifyService.fetchProductsByCategory(
              categoryId: categoryId, page: 1, limit: 5,search:search ) ??
          [];
      productList = data;
      update();
      return data;
    } on Exception catch (e) {
      return [];
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    isBack = Get.arguments ?? false;
    getProductDataByCollectionId(collections[0]['category'], "");
    update();
    super.onReady();
  }
}
