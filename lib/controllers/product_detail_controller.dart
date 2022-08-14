import 'package:tulsiresin/common/array/product.dart';
import 'package:tulsiresin/config.dart';
import 'package:tulsiresin/mixins/shopify_mixin.dart';
import 'package:tulsiresin/models/product.dart';
import 'package:tulsiresin/views/image_gallery.dart';

import '../models/index.dart';

class ProductDetailController extends GetxController with ShopifyMixin {
  ProductModel? product;
  int currentPage = 0;
  TextEditingController txtQuantity = TextEditingController();
  List<ProductViewModel> youMayAlsoLike = [];

  int variantIndex = 0;
  String? optionValue = "";

  @override
  void onReady() {
    // TODO: implement onReady
    txtQuantity.text = "1";
    product = Get.arguments;

    if (product != null) optionValue = product!.options![0].values![0];
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

  void handleImageTap(BuildContext context,
      {int index = 0, bool fullScreen = false}) {
    onShowGallery(context, index);
  }

  void onShowGallery(BuildContext context, [int index = 0]) {
    showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return ImageGalery(images: product!.images, index: index);
        });
  }
}
