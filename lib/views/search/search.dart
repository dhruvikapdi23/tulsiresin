import 'package:tulsiresin/app_services/config.dart';
import 'package:tulsiresin/common/array/product.dart';
import 'package:tulsiresin/config.dart';
import 'package:tulsiresin/controllers/dashboard_controller.dart';
import 'package:tulsiresin/controllers/search_controller.dart';
import 'package:tulsiresin/views/home/widgets/recent_view_list.dart';
import 'package:tulsiresin/views/search/widgets/recent_search_card.dart';
import 'package:tulsiresin/views/search/widgets/recent_search_product.dart';
import 'package:tulsiresin/widgets/common/custom_text_form_field.dart';

import '../../models/product.dart';

class Search extends StatelessWidget {
  final searchCtrl = Get.put(SearchController());

  Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List collections = config['home']['collections'] ?? [];

    return GetBuilder<SearchController>(builder: (_) {
      return Scaffold(
        backgroundColor: appCtrl.appTheme.surface,
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: appCtrl.appTheme.surface,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: CustomTextFormField(
            radius: AppRadius.r50,
            controller: searchCtrl.txtSearch,
            fillColor: appCtrl.appTheme.grey,
            hintText: CommonFonts().searchForItem,
            onChanged: (val) => searchCtrl.searchList(val),
            prefixIcon: SvgPicture.asset(svgAssets.search),
            inputBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
          actions: [
            GetBuilder<DashboardController>(builder: (ctrl) {
              return Text(CommonFonts().cancel)
                  .fontSize(FontSizes.s14)
                  .alignment(Alignment.center)
                  .marginOnly(right: Insets.i15)
                  .gestures(onTap: () {
                ctrl.selectedIndex = 0;
                ctrl.update();
              });
            })
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(vertical: Insets.i15),
                margin: const EdgeInsets.symmetric(vertical: Insets.i10),
                color: appCtrl.appTheme.graySecondary,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(CommonFonts().recentSearch)
                        .textColor(appCtrl.appTheme.black),
                    Icon(
                      Icons.cancel,
                      color: appCtrl.appTheme.secondaryGray,
                    ),
                  ],
                ).marginSymmetric(horizontal: Insets.i15),
              ),
              if (searchCtrl.searchListData.isEmpty &&
                  searchCtrl.txtSearch.text.isEmpty)

                ...searchCtrl.productList.asMap().entries.map((e) {
                  return RecentSearchCard(
                    recentSearchModel: e.value,
                  ).gestures(onTap: () {
                    print(e.value);
                    /*Get.toNamed(routeName.productDetail,arguments: e.value);*/
                  });
                }).toList(),
              if (searchCtrl.searchListData.isNotEmpty)
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: searchCtrl.searchListData.length,
                  itemBuilder: (context, index) {
                    return RecentSearchProduct(
                      productViewModel: searchCtrl.searchListData[index],
                      onTap: () {
                        /* searchCtrl.productList[index].isFav = !searchCtrl.productList[index].isFav!;
                        searchCtrl.update();*/
                      },
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 2,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 1)),
                ).marginSymmetric(horizontal: Insets.i15)
            ],
          ),
        ),
      );
    });
  }
}
