import 'package:tulsiresin/common/array/product.dart';
import 'package:tulsiresin/config.dart';
import 'package:tulsiresin/models/product.dart';
import 'package:tulsiresin/views/image_gallery.dart';

class ProductDetailController extends GetxController{
  Product? product;
  int currentPage =0;
TextEditingController txtQuantity = TextEditingController();
List<ProductViewModel> youMayAlsoLike = [];

  int variantIndex =0;
  String? optionValue = "";

  @override
  void onReady() {
    // TODO: implement onReady
    txtQuantity.text ="1";
    product = Get.arguments;
    youMayAlsoLike = recentViewList;
    optionValue =product!.options![0].values![0];
    update();
    super.onReady();
  }

  void handleImageTap(BuildContext context,
      {int index = 0, bool fullScreen = false}) {

    onShowGallery(context, index);
  }

  void onShowGallery(BuildContext context, [int index = 0]) {
    showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          print(product!.images);
          return ImageGalery(images: product!.images, index: index);
        });
  }
}