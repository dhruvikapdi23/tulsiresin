import 'package:tulsiresin/common/array/product.dart';
import 'package:tulsiresin/config.dart';
import 'package:tulsiresin/models/product.dart';

class HomeController extends GetxController {
  List<ProductModel> recentView = [];
  List<ProductModel> womenCollection = [];

  @override
  void onReady() {
    // TODO: implement onReady
    recentView = geRecentProducts;
    womenCollection = geRecentProducts;
    update();
    super.onReady();
  }
}
