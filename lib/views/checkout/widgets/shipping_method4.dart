import 'package:tulsiresin/controllers/checkout_controller.dart';

import '../../../config.dart';

class ShippingMetod4 extends StatelessWidget {
  const ShippingMetod4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(builder: (checkoutCtrl) {
      return ListTile(
        horizontalTitleGap: 2,
        contentPadding: EdgeInsets.zero,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("\$ 11.00")
                    .fontWeight(FontWeight.w600)
                    .fontSize(FontSizes.s18),
                Space(10, 0),
                Text("48 hours coffee")
                    .textColor(Color(0xFF737680))
                    .fontSize(FontSizes.s16),
              ],
            ),
            Space(0, 5),
            Row(
              children: [
                Text("Delivery within 48 hours")
                    .textColor(Color(0xFFA3A5AD))
                    .fontSize(FontSizes.s12),
                Space(10, 0),
                Text("+info")
                    .textColor(appCtrl.appTheme.black)
                    .fontSize(FontSizes.s12),
              ],
            ).marginOnly(bottom: Insets.i15),
            Divider(
              color: checkoutCtrl.shippingMethod == "48 hours coffee"
                  ? appCtrl.appTheme.grey
                  : appCtrl.appTheme.lightGray,
            )
          ],
        ).marginOnly(left: Insets.i10, top: Insets.i10).backgroundColor(
            checkoutCtrl.shippingMethod == "48 hours coffee"
                ? appCtrl.appTheme.grey
                : appCtrl.appTheme.surface).gestures(onTap: () {
          print('s');
          checkoutCtrl.shippingMethod = "48 hours coffee";
          checkoutCtrl.update();
        }),
        leading: Radio(
            value: "48 hours coffee",
            groupValue: checkoutCtrl.shippingMethod,
            onChanged: (value) {
              checkoutCtrl.shippingMethod = value.toString();
              checkoutCtrl.update();
            }),
      ).gestures(onTap: () {
        print('s');
        checkoutCtrl.shippingMethod = "48 hours coffee";
        checkoutCtrl.update();
      });
    });
  }
}
