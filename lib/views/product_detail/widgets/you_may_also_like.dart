import 'package:tulsiresin/common/array/product.dart';
import 'package:tulsiresin/config.dart';
import 'package:tulsiresin/controllers/product_detail_controller.dart';
import 'package:tulsiresin/views/home/widgets/recent_view_list.dart';

class YouMayAlsoLike extends StatelessWidget {
  const YouMayAlsoLike({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  ...geRecentProducts.asMap().entries.map((e) {
                    return RecentViewListCard(
                      data: e.value,
                      index: e.key,

                      heartIconTap: (){
                        /*e.value.isFav = !e.value.isFav!;
                            homeCtrl.update();*/
                      },
                    );
                  })
                ],
              ).marginOnly(left: Insets.i20),
            ),

          ],
        ).marginSymmetric(horizontal: Insets.i15,);
      }
    );
  }
}
