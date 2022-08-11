import 'package:flutter/foundation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:tulsiresin/common/array/category.dart';
import 'package:tulsiresin/config.dart';
import 'package:tulsiresin/mixins/shopify_mixin.dart';
import 'package:tulsiresin/models/category_model.dart';

class CategoryController extends GetxController with ShopifyMixin {
  final PagingController pagingController = PagingController(firstPageKey: 0);
  TextEditingController txtSearch = TextEditingController();

  List categoryListData = [];

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
    categoryListData = getCategories;
    update();
    super.onReady();
  }

  void getData(int pageKey) async {
    try {
      List<CategoryModel> data = await shopifyService.getCategoriesByCursor();
      pagingController.appendLastPage(data);
    } on Exception catch (e) {
      pagingController.error = e;
    }
  }
}
