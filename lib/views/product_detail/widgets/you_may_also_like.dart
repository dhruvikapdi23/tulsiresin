import 'package:tulsiresin/app_services/config.dart';
import 'package:tulsiresin/common/array/product.dart';
import 'package:tulsiresin/config.dart';
import 'package:tulsiresin/controllers/product_detail_controller.dart';
import 'package:tulsiresin/models/product.dart';
import 'package:tulsiresin/views/home/widgets/recent_view_list.dart';

class YouMayAlsoLike extends StatelessWidget {
  const YouMayAlsoLike({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List collections = config['home']['collections'] ?? [];
    return GetBuilder<ProductDetailController>(
      builder: (productDetail) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(CommonFonts().youMayAlsoLike)
                .fontSize(FontSizes.s18)
                .fontWeight(FontWeight.w600)
                .textColor(appCtrl.appTheme.black),
            Divider(color: appCtrl.appTheme.lightGray,endIndent: Insets.i100,),
            Space(0, 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  FutureBuilder(
                    future: productDetail.getProductDataByCollectionId(collections[0]['category']),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        // If we got an error
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              '${snapshot.error} occurred',
                              style: const TextStyle(fontSize: 18),
                            ),
                          );

                          // if we got our data
                        } else if (snapshot.hasData) {
                          // Extracting data from snapshot object
                          final data = snapshot.data as List<ProductModel>;
                          print('data : $data');
                          return   SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(children: [
                              ...data.asMap().entries.map((e) {

                                return RecentViewListCard(
                                  data: e.value,
                                  index: e.key,
                                  onTap: () => Get.toNamed(routeName.productDetail, arguments: e.value),
                                  heartIconTap: () {},
                                );
                              }).toList(),
                            ]),
                          );
                        }
                      }
                      return const CircularProgressIndicator();
                    },
                  ),
                ],
              ).marginOnly(left: Insets.i20),
            ),

          ],
        ).marginSymmetric(horizontal: Insets.i15,);
      }
    );
  }
}
