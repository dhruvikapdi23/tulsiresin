import 'package:tulsiresin/config.dart';
import 'package:tulsiresin/widgets/common/custom_button.dart';

class OrderSuccess extends StatelessWidget {
  const OrderSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: appCtrl.appTheme.gray6,
        title:  Text(CommonFonts().checkout),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: Insets.i20),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: Insets.i25),
              color: appCtrl.appTheme.gray6,
              child: Column(
                children: [
                  Text(CommonFonts().itsOrdered)
                      .fontWeight(FontWeight.w600)
                      .fontSize(FontSizes.s18),
                  Space(0, 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(CommonFonts().orderNo)
                          .textColor(appCtrl.appTheme.txt)
                          .fontSize(FontSizes.s14),
                      Text('#80932031-030-00')
                          .textColor(appCtrl.appTheme.black)
                          .fontSize(FontSizes.s14)
                          .fontWeight(FontWeight.w600),
                    ],
                  ),
                ],
              ),
            ),
            Text(CommonFonts().successTitle)
                .fontWeight(FontWeight.w600)
                .fontSize(FontSizes.s16),
            Space(0, 15),
            Text(CommonFonts().successDesc)
                .textColor(appCtrl.appTheme.txt)
                .fontSize(FontSizes.s14)
                .letterSpacing(1)
                .textHeight(1.5),
            Space(0, 30),
            CustomButton(
              title: CommonFonts().showMyAllOrdered,
              radius: 0,
            ),
            Space(0, 30),
            Text(
              CommonFonts().yourAccount,
            ).fontWeight(FontWeight.w600).fontSize(FontSizes.s16),
            Space(0, 15),
            Text(CommonFonts().successDesc1)
                .textColor(appCtrl.appTheme.txt)
                .fontSize(FontSizes.s14)
                .letterSpacing(1)
                .textHeight(1.5),
            Space(0, 30),
            CustomButton(
              title: CommonFonts().backToShop,
              radius: 0,
              fontColor: appCtrl.appTheme.black,
              border: Border.all(color: appCtrl.appTheme.black),
              color: appCtrl.appTheme.surface,
              onTap: () => Get.offAllNamed(routeName.dashboard),
            ),
          ],
        ).marginSymmetric(horizontal: Insets.i15, vertical: Insets.i15),
      ),
    );
  }
}
