import 'package:flutter/cupertino.dart';
import 'package:tulsiresin/common/array/language_array.dart';
import 'package:tulsiresin/common/language/index.dart';
import 'package:tulsiresin/language.dart';

import '../../../config.dart';

class DynamicListCard extends StatelessWidget {
  final dynamic data;
  final dynamic child;

  const DynamicListCard({Key? key, this.data, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(data['title'].toString().tr)
            .textColor(appCtrl.appTheme.txt)
            .fontSize(FontSizes.s18)
            .fontWeight(FontWeight.w700),
        ...child.asMap().entries.map((data) {
          return Column(
            children: [
              ListTile(
                title: Text(data.value['name'].toString().tr)
                    .textColor(appCtrl.appTheme.grayPrimary),
                leading: (data.value['name'] == "Dark Theme" ||
                        data.value['name'] == "डार्क थीम")
                    ? const Icon(CupertinoIcons.moon)
                    : (data.value['name'] == "Language" ||
                            data.value['name'] == "भाषा")
                        ? const Icon(CupertinoIcons.globe)
                        : SvgPicture.asset(
                            data.value['icon'],
                          ),
                trailing: (data.value['name'] == "Dark Theme" ||
                        data.value['name'] == "डार्क थीम")
                    ? Switch(
                        onChanged: (val) {
                          print(val);
                          appCtrl.isDark = val;
                          appCtrl.update();
                          ThemeService().switchTheme();
                        },
                        value: appCtrl.isDark,
                        activeColor: appCtrl.appTheme.primary,
                        activeTrackColor: appCtrl.appTheme.grey)
                    : Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: appCtrl.appTheme.grayPrimary,
                      ),
              ),
              (data.key != child.length - 1)
                  ? const Divider(
                      indent: 50,
                    )
                  : Space(0, 50),
            ],
          ).gestures(onTap: () {
            if (data.value['name'] == "Order history") {
              Get.toNamed(routeName.orderHistory);
            } else if (data.value['name'] == "My Wishlist") {
              Get.toNamed(routeName.wishList);
            } else if (data.value['name'] == "Get Notifications") {
              Get.toNamed(routeName.notification);
            } else if (data.value['name'] == "My Address") {
              Get.toNamed(routeName.addressList);
            } else if (data.value['name'] == "Language" ||
                data.value['name'] == "भाषा") {
              Get.bottomSheet(
                Container(
                  color: appCtrl.appTheme.white,
                  padding: const EdgeInsets.symmetric(vertical: Insets.i15),
                  child: GetBuilder<AppController>(
                      builder: (appCtrl) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,

                        children: [
                          Text(CommonFonts().language)
                              .fontSize(FontSizes.s18)
                              .fontWeight(FontWeight.bold),
                          Divider(
                            color: appCtrl.appTheme.borderGray,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...languageList.asMap().entries.map((e) {
                                return Text(e.value['title']!.tr)
                                    .fontSize(FontSizes.s18)
                                    .marginSymmetric(
                                    horizontal: Insets.i15, vertical: Insets.i10)
                                    .gestures(onTap: () {
                                  if (e.value['title'] == "English" ||
                                      e.value['title'] == "अंग्रेज़ी") {
                                    var locale = const Locale("en", 'US');
                                    Get.updateLocale(locale);
                                    appCtrl.languageCode = "en";
                                    appCtrl.countryCode = "US";
                                    appCtrl.getStorage
                                        .write(Session.languageCode, "en");
                                    appCtrl.getStorage.write(Session.countryCode, "US");
                                    appCtrl.update();
                                  } else if (e.value['title'] == "Hindi" ||
                                      e.value['title'] == "हिन्दी") {
                                    var locale = const Locale("hi", 'IN');
                                    Get.updateLocale(locale);
                                    appCtrl.languageCode = "hi";
                                    appCtrl.countryCode = "IN";
                                    appCtrl.getStorage
                                        .write(Session.languageCode, "hi");
                                    appCtrl.getStorage.write(Session.countryCode, "IN");
                                  }
                                  appCtrl.update();
                                });
                              }).toList()
                            ],
                          ).width(MediaQuery.of(context).size.width)
                        ],
                      );
                    }
                  ),
                ),
              );
            }
          });
        }).toList()
      ],
    );
  }
}
