import 'package:tulsiresin/app_services/config.dart';
import 'package:tulsiresin/config.dart';
import 'package:tulsiresin/mixins/shopify_mixin.dart';
import 'package:tulsiresin/models/product.dart';

class WishlistController extends GetxController with ShopifyMixin{
  List<ProductModel> cartList =[];

  int quantity =0;
  List collections = config['home']['collections'] ?? [];

  @override
  void onReady() {
    // TODO: implement onReady
    // cartList = geCartProducts;
    update();
    getProductDataByCollectionId(collections[0]['category'],'');
    super.onReady();
  }
  bool isBack = false;
  List<ProductModel> cartListData = [];
  List<ProductModel> searchListData = [];


  Future<List<ProductModel>> getProductDataByCollectionId(
      String categoryId,search) async {

    try {
      List<ProductModel> data = await shopifyService.fetchProductsByCategory(
          categoryId: categoryId, page: 1, limit: 5,search:search ) ??
          [];
      cartListData = data;
      for(var i=0;i<1;i++){
        cartList.add(cartListData[i]);
      }
      update();
      return data;
    } on Exception catch (e) {
      return [];
    }
  }


}