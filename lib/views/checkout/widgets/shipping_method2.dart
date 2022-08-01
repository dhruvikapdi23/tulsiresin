import 'package:tulsiresin/controllers/checkout_controller.dart';

import '../../../config.dart';

class ShippingMethod2 extends StatelessWidget {
  const ShippingMethod2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(
      builder: (checkoutCtrl) {
        return ListTile(
          horizontalTitleGap: 2,
          contentPadding: EdgeInsets.zero,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("\$ 9.90")
                      .fontWeight(FontWeight.w600)
                      .fontSize(FontSizes.s18),
                  Space(10, 0),
                  Text("Delivery to home")
                      .textColor(Color(0xFF737680))
                      .fontSize(FontSizes.s16),
                ],
              ),
              Space(0, 5),
              Text("Delivery from 4 to 6 business days")
                  .textColor(Color(0xFFA3A5AD))
                  .fontSize(FontSizes.s12)
                  .marginOnly(bottom: Insets.i15),
              Divider(
                color: checkoutCtrl.shippingMethod == "home"
              ? appCtrl.appTheme.grey
                : appCtrl.appTheme.lightGray,
              )
            ],
          ).marginOnly(left: Insets.i10,top: Insets.i10).backgroundColor(checkoutCtrl.shippingMethod == "home"
              ? appCtrl.appTheme.grey
              : appCtrl.appTheme.surface),
          leading: Radio(
              value: "home",
              groupValue: checkoutCtrl.shippingMethod,
              onChanged: (value) {
                checkoutCtrl.shippingMethod = value.toString();
                checkoutCtrl.update();
              }),
        ).gestures(onTap: (){
          checkoutCtrl.shippingMethod = "home";
          checkoutCtrl.update();
        });
      }
    );
  }
}
