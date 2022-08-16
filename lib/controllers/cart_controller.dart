import 'package:get_storage/get_storage.dart';
import 'package:tulsiresin/app_services/config.dart';
import 'package:tulsiresin/common/array/product.dart';
import 'package:tulsiresin/config.dart';
import 'package:tulsiresin/mixins/shopify_mixin.dart';
import 'package:tulsiresin/models/product.dart';
import 'package:tulsiresin/models/variants.dart';
import 'package:tulsiresin/views/product/product.dart';

class CartController extends GetxController with ShopifyMixin {
  List<ProductModel> cartList = [];

  int quantity = 0;
  List collections = config['home']['collections'] ?? [];
  final Map<String, Variants?> productVariationInCart = {};
  final Map<String, int?> productsInCart = {};
  final Map<String?, ProductModel?> item = {};

  @override
  void onReady() {
    // TODO: implement onReady
    // cartList = geCartProducts;
    update();
    //getProductDataByCollectionId(collections[0]['category'], '');
    //getCartFromLocal();
    super.onReady();
  }

  bool isBack = false;
  List<ProductModel> cartListData = [];
  List<ProductModel> searchListData = [];

  int get totalCartQuantity => productsInCart.values.fold(0, (v, e) => v + e!);

  Future<void> getCartFromLocal() async {
    try {
      List? items = await getStorage('cart');
      if (items != null && items.isNotEmpty) {
        for (final item in items) {
          addProductToCart(
            product: ProductModel.fromJson(item['product']),
            quantity: item['quantity'],
            variation: item['variation'] != 'null' ? Variants.fromJson(item['variation']) : null,
            isSaveLocal: false,
          );
        }
      }
    } catch (err) {
      printLog('::::::::: Get Cart In Local Error: $err');
    }
  }

  String addProductToCart({
    context,
    ProductModel? product,
    int? quantity = 1,
    Variants? variation,
    isSaveLocal = true,
  }) {
    var defaultVariation = variation;
    var key = product!.id.toString();

    item[key] = product;

    //printLog("::: ${product.toJson()}");

    if (defaultVariation?.id == null) {
      /*product.variants?.forEach((element) {
        printLog("::: ${element.title}");
        printLog("::: ${element.toJson()}");
      });*/
      defaultVariation = product.variants?.firstWhere((element) => (element.inStock ?? false));
    }

    key += '-${defaultVariation!.id}';
    productVariationInCart[key] = defaultVariation;

    if (isSaveLocal) {
      saveCartToLocal(
        product: product,
        quantity: quantity,
        variation: defaultVariation,
      );
    }

    var quantityOfProductInCart = productsInCart[key] ?? 0;

    if (!productsInCart.containsKey(key)) {
      productsInCart[key] = quantity;
    } else {
      final stockQuantity = defaultVariation.stockQuantity ?? 0;
      if (quantityOfProductInCart == stockQuantity) {
        return "The maximum quantity has been exceeded";
      }

      quantityOfProductInCart += quantity!;
      if (quantityOfProductInCart > stockQuantity) {
        quantityOfProductInCart = stockQuantity;
      }
      productsInCart[key] = quantityOfProductInCart;
    }

    update();
    return '';
  }

  Future<void> saveCartToLocal({ProductModel? product, int? quantity = 1, Variants? variation, Map<String, dynamic>? options}) async {
    try {
      List? items = await getStorage('cart');
      if (items != null && items.isNotEmpty) {
        items.add({
          'product': product!.toJson(),
          'quantity': quantity,
          'variation': variation != null ? variation.toJson() : 'null',
          'options': options,
        });
      } else {
        items = [
          {
            'product': product!.toJson(),
            'quantity': quantity,
            'variation': variation != null ? variation.toJson() : 'null',
            'options': options,
          }
        ];
      }
      await writeStorage('cart', items);
    } catch (err) {
      printLog('[saveCartToLocal] failed: $err');
    }
  }

  String cleanProductID(productString) {
    // In case 1234+https://somelink.com/might-have-dash-character-here
    if (productString.contains('-') && !productString.contains('+')) {
      return productString.split('-')[0].toString();
    } else if (productString.contains('+')) {
      // In case 1234-6789+https://someaddonsoption
      return cleanProductID(productString.split('+')[0].toString());
    } else {
      return productString.toString();
    }
  }

  ProductModel? getProductById(String id) {
    return item[id];
  }

  double? getSubTotal() {
    return productsInCart.keys.fold(0.0, (sum, key) {
      if (productVariationInCart[key] != null && productVariationInCart[key]!.price != null && productVariationInCart[key]!.price!.isNotEmpty) {
        return (sum ?? 0) + double.parse(productVariationInCart[key]!.price!) * productsInCart[key]!;
      } else {
        var price = getPriceProductValue(item[key], onSale: true)!;
        if (price.isNotEmpty) {
          return (sum ?? 0) + double.parse(price) * productsInCart[key]!;
        }
        return sum;
      }
    });
  }

  String? getPriceProductValue(ProductModel? product, {bool? onSale}) {
    try {
      String? price;
      if (onSale == true) {
        price = (isNotBlank(product!.salePrice) ? product.salePrice ?? '0' : product.price);
      } else {
        price = (isNotBlank(product!.regularPrice) ? product.regularPrice ?? '0' : product.price);
      }
      return price;
    } catch (e, trace) {
      printLog(e.toString());
      printLog(trace.toString());
      return '';
    }
  }

  bool isNotBlank(String? s) => s != null && s.trim().isNotEmpty;

  /*Future<List<ProductModel>> getProductDataByCollectionId(String categoryId, search) async {
    try {
      List<ProductModel> data = await shopifyService.fetchProductsByCategory(categoryId: categoryId, page: 1, limit: 5, search: search) ?? [];
      cartList = data;

      update();
      return data;
    } on Exception catch (e) {
      return [];
    }
  }*/
}
