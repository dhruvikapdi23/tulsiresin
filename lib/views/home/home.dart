import 'package:tulsiresin/app_services/config.dart';
import 'package:tulsiresin/common/array/product.dart';
import 'package:tulsiresin/controllers/dashboard_controller.dart';
import 'package:tulsiresin/controllers/home_controller.dart';
import 'package:tulsiresin/models/product.dart';
import 'package:tulsiresin/views/home/widgets/banner_list.dart';
import 'package:tulsiresin/views/home/widgets/collection_products.dart';
import 'package:tulsiresin/views/home/widgets/common_title.dart';
import 'package:tulsiresin/views/home/widgets/recent_view_list.dart';

import '../../config.dart';

class Home extends StatelessWidget {
  final homeCtrl = Get.put(HomeController());
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List collections = config['home']['collections'] ?? [];

    return GetBuilder<HomeController>(builder: (_) {
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
            GetBuilder<DashboardController>(builder: (ctrl) {
              return SvgPicture.asset(
                svgAssets.search,
                height: Sizes.s20,
              ).gestures(onTap: () {
                ctrl.selectedIndex = 2;
                ctrl.update();
                homeCtrl.update();
              }).paddingOnly(right: Insets.i15);
            })
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // banner list
              const BannerList(),
              ...collections.map((collection) {
                return CollectionProducts(collection: collection);
              }).toList(),
            ],
          ).marginOnly(bottom: Insets.i50),
        ),
      );
    });
  }
}
