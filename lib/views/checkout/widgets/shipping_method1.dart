import 'package:tulsiresin/controllers/checkout_controller.dart';

import '../../../config.dart';

class ShippingMethod1 extends StatelessWidget {
  const ShippingMethod1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(builder: (checkoutCtrl) {
      return ListTile(
        contentPadding: EdgeInsets.zero,

        horizontalTitleGap: 2,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("Free")
                    .fontWeight(FontWeight.w600)
                    .fontSize(FontSizes.s18),
                Space(10, 0),
                Text("Pickup in the store")
                    .textColor(Color(0xFF737680))
                    .fontSize(FontSizes.s16),
              ],
            ),
            Space(0, 5),
            Text("Delivery from 3 to 7 business days")
                .textColor(Color(0xFFA3A5AD))
                .fontSize(FontSizes.s12)
                .marginOnly(bottom: Insets.i15),
            Divider(
              color: checkoutCtrl.shippingMethod == "Free"
                  ? appCtrl.appTheme.grey
                  : appCtrl.appTheme.lightGray,
            )
          ],
        ).marginOnly(left: Insets.i10,top: Insets.i10).backgroundColor(checkoutCtrl.shippingMethod == "Free"
            ? appCtrl.appTheme.grey
            : appCtrl.appTheme.surface),
        leading: Radio(
            value: "Free",
            groupValue: checkoutCtrl.shippingMethod,
            onChanged: (value) {
              checkoutCtrl.shippingMethod = value.toString();
              checkoutCtrl.update();
            }),
      ).marginSymmetric(vertical: Insets.i5).gestures(onTap: () {
        checkoutCtrl.shippingMethod = "Free";
        checkoutCtrl.update();
      });
    });
  }
}
