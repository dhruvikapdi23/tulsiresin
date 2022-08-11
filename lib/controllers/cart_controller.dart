import 'package:tulsiresin/common/array/product.dart';
import 'package:tulsiresin/config.dart';
import 'package:tulsiresin/models/product.dart';

class CartController extends GetxController{
  List<ProductModel> cartList =[];

  int quantity =0;

  @override
  void onReady() {
    // TODO: implement onReady
    cartList = geCartProducts;
    update();
    super.onReady();
  }
}