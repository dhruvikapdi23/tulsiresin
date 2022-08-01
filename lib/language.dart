import 'package:tulsiresin/common/array/language_array.dart';
import 'package:tulsiresin/config.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Scaffold(
          backgroundColor: appCtrl.appTheme.white,
          appBar: AppBar(
            backgroundColor: appCtrl.appTheme.white,
            title: Text(CommonFonts().language),
            elevation: 0,
          ),
          body: Column(
            children: [
              ...languageList.asMap().entries.map((e) {
                return Row(
                  children: [
                    Text(e.value['title']!.tr).fontSize(FontSizes.s18)
                  ],
                ).marginSymmetric(horizontal: Insets.i15, vertical: Insets.i10).gestures(onTap: (){
                  if (e.value['title'] == "English" || e.value['title'] == "अंग्रेज़ी") {

                    var locale = const Locale("en", 'US');
                    Get.updateLocale(locale);
                    appCtrl.languageCode = "en";
                    appCtrl.countryCode = "US";
                    appCtrl.getStorage.write(Session.languageCode, "en");
                    appCtrl.getStorage.write(Session.countryCode, "US");
                    appCtrl.update();
                  } else if (e.value['title'] == "Hindi" || e.value['title'] == "हिन्दी") {
                    var locale = const Locale("hi", 'IN');
                    Get.updateLocale(locale);
                    appCtrl.languageCode = "hi";
                    appCtrl.countryCode = "IN";
                    appCtrl.getStorage.write(Session.languageCode, "hi");
                    appCtrl.getStorage.write(Session.countryCode, "IN");
                  }
                  appCtrl.update();
                });
              }).toList()
            ],
          ),
        );
      }
    );
  }
}
