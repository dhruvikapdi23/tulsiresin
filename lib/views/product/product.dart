import 'package:tulsiresin/common/array/product.dart';
import 'package:tulsiresin/config.dart';
import 'package:tulsiresin/controllers/dashboard_controller.dart';
import 'package:tulsiresin/controllers/product_controller.dart';
import 'package:tulsiresin/views/search/widgets/recent_search_product.dart';

class Product extends StatelessWidget {
  final productCtrl = Get.put(ProductController());

  Product({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: Icon(
            Icons.arrow_back,
            color: appCtrl.appTheme.white,
          ).gestures(onTap: () => Get.back()),
          title: const Text('Dress').textColor(appCtrl.appTheme.white),
          actions: [
            GetBuilder<DashboardController>(builder: (dashCtrl) {
              return SvgPicture.asset(
                svgAssets.search,
                height: Sizes.s20,
                color: appCtrl.appTheme.white,
              ).gestures(onTap: () {
                Get.back();
                dashCtrl.selectedIndex = 2;
                dashCtrl.update();
              }).marginOnly(right: Insets.i15);
            })
          ],
        ),
        backgroundColor: appCtrl.appTheme.primary,
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(vertical: Insets.i15),
          decoration: BoxDecoration(
              color: appCtrl.appTheme.white,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(AppRadius.r20),
                  topLeft: Radius.circular(AppRadius.r20))),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: geRecentProducts.length,
            itemBuilder: (context, index) {
              return RecentSearchProduct(
                productViewModel: geRecentProducts[index],
                onTap: () {
                  /*recentViewList[index].isFav = !recentViewList[index].isFav!;
                  productCtrl.update();*/
                },
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1)),
          ).marginSymmetric(horizontal: Insets.i15),
        ),
      );
    });
  }
}