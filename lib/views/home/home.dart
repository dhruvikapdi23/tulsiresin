import 'package:tulsiresin/common/array/product.dart';
import 'package:tulsiresin/controllers/dashboard_controller.dart';
import 'package:tulsiresin/controllers/home_controller.dart';
import 'package:tulsiresin/views/home/widgets/banner_list.dart';
import 'package:tulsiresin/views/home/widgets/common_title.dart';
import 'package:tulsiresin/views/home/widgets/recent_view_list.dart';

import '../../config.dart';

class Home extends StatelessWidget {
  final homeCtrl = Get.put(HomeController());
   Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) {
        return Scaffold(
          backgroundColor: appCtrl.appTheme.surface,
          appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            centerTitle: false,

            backgroundColor: appCtrl.appTheme.surface,
            title: Image.asset(
              imageAssets.logo,
              height: Sizes.s50,
              width: Sizes.s100,
              fit: BoxFit.contain,
            ),
            actions: [
              GetBuilder<DashboardController>(
                builder: (ctrl) {
                  return SvgPicture.asset(
                    svgAssets.search,
                    height: Sizes.s20,
                  ).gestures(onTap: (){
                    ctrl.selectedIndex =2;
                    ctrl.update();
                    homeCtrl.update();
                  }).paddingOnly(right: Insets.i15);
                }
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                // banner list
                const BannerList(),

                //recent View
                 CommonTitle(
                  title: CommonFonts().recentView,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...geRecentProducts.asMap().entries.map((e) {
                        return RecentViewListCard(
                          data: e.value,
                          index: e.key,
                          onTap: ()=> Get.toNamed(routeName.productDetail,arguments: e.value),
                          heartIconTap: (){
                            /*e.value.isFav = !e.value.isFav!;
                            homeCtrl.update();*/
                          },
                        );
                      })
                    ],
                  ).marginOnly(left: Insets.i20),
                ),

                //recent View
                CommonTitle(
                  title: CommonFonts().womenCollection,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...geRecentProducts1.asMap().entries.map((e) {
                        return RecentViewListCard(
                          data: e.value,
                          index: e.key,
                          onTap: ()=> Get.toNamed(routeName.productDetail,arguments: e.value),
                          heartIconTap: (){
                           /* e.value.isFav = !e.value.isFav!;
                            homeCtrl.update();*/
                          },
                        );
                      })
                    ],
                  ).marginOnly(left: Insets.i20),
                ),
              ],
            ).marginOnly(bottom: Insets.i50),
          ),
        );
      }
    );
  }
}
