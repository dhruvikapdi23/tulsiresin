import 'package:tulsiresin/common/array/language_array.dart';

import '../../../config.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
