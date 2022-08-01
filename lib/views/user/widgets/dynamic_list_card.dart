import 'package:flutter/cupertino.dart';
import 'package:tulsiresin/common/language/index.dart';
import 'package:tulsiresin/language.dart';

import '../../../config.dart';

class DynamicListCard extends StatelessWidget {
  final dynamic data;
  final dynamic child;

  const DynamicListCard({Key? key, this.data, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Route _createRoute() {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const LanguageScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      );
    }
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
                leading:(data.value['name'] == "Dark Theme" ||data.value['name'] == "डार्क थीम") ? const Icon(CupertinoIcons.moon) :(data.value['name'] == "Language" ||data.value['name'] == "भाषा") ? const Icon(CupertinoIcons.globe): SvgPicture.asset(
                  data.value['icon'],
                ),
                trailing: (data.value['name'] == "Dark Theme" ||data.value['name'] == "डार्क थीम") ?
                Switch(
                  onChanged: (val){
                    print(val);
                    appCtrl.isDark = val;
                    appCtrl.update();
                    ThemeService().switchTheme();
                  },
                  value: appCtrl.isDark,
                  activeColor: appCtrl.appTheme.primary,
                  activeTrackColor: appCtrl.appTheme.grey
                )
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
            }else if(data.value['name'] == "My Wishlist"){
              Get.toNamed(routeName.wishList);
            }else if(data.value['name'] == "Get Notifications"){
              Get.toNamed(routeName.notification);
            }else if(data.value['name'] == "My Address"){
              Get.toNamed(routeName.addressList);
            }else if(data.value['name'] == "Language"||data.value['name'] == "भाषा"){
              Get.bottomSheet(
                  const LanguageScreen()
              );
            }
          });
        }).toList()
      ],
    );
  }
}
