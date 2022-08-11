import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:tulsiresin/config.dart';
import 'package:tulsiresin/mixins/shopify_mixin.dart';
import 'package:tulsiresin/models/product.dart';

class ProductController extends GetxController with ShopifyMixin {
  final PagingController pagingController = PagingController(firstPageKey: 0);
  bool isBack = false;
  static const _pageSize = 20;

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      getData(pageKey);
    });
    super.onInit();
  }

  Future refreshData() async {
    return getData(0);
  }

  @override
  void onReady() {
    // TODO: implement onReady
    //isBack = Get.arguments ?? false;
    update();
    super.onReady();
  }

  void getData(int pageKey) async {
    try {
      var args = Get.arguments;
      String categoryId = args['categoryId'];

      List<ProductModel> data = await shopifyService.fetchProductsByCategory(
            categoryId: categoryId,
            page: (pageKey / _pageSize).round() + 1,
            limit: _pageSize,
          ) ??
          [];

      final isLastPage = data.length < _pageSize;

      if (pageKey == 0 && !isNullOrBlank(pagingController.itemList)) {
        pagingController.itemList = [];
      }

      if (isLastPage) {
        pagingController.appendLastPage(data);
      } else {
        final nextPageKey = pageKey + data.length;
        pagingController.appendPage(data, nextPageKey);
      }
    } on Exception catch (e) {
      pagingController.error = e;
    }
  }
}
