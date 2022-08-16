import 'package:tulsiresin/common/array/product.dart';
import 'package:tulsiresin/config.dart';
import 'package:tulsiresin/mixins/shopify_mixin.dart';
import 'package:tulsiresin/models/product.dart';

class HomeController extends GetxController with ShopifyMixin {
  List<ProductModel> recentView = [];
  List<ProductModel> womenCollection = [];

  @override
  void onReady() {
    // TODO: implement onReady
    // recentView = geRecentProducts;
    //womenCollection = geRecentProducts;
    update();
    super.onReady();
  }

  Future<List<ProductModel>> getProductDataByCollectionId(String categoryId) async {
    try {
      List<ProductModel> data = await shopifyService.fetchProductsByCategory(categoryId: categoryId, page: 1, limit: 5) ?? [];
      return data;
    } on Exception catch (e) {
      return [];
    }
  }
}
