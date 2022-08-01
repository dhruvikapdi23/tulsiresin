import 'package:tulsiresin/config.dart';
import 'package:tulsiresin/controllers/checkout_controller.dart';

class ShippingMethod3 extends StatelessWidget {
  const ShippingMethod3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(builder:(checkoutCtrl) => ListTile(
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
              Text("Paszkomaty Inpost")
                  .textColor(Color(0xFF737680))
                  .fontSize(FontSizes.s16),
            ],
          ),
          Space(0, 5),
          Row(
            children: [
              Text("Delivery from 4 to 6 business days")
                  .textColor(Color(0xFFA3A5AD))
                  .fontSize(FontSizes.s12),
              Space(10, 0),
              Text("${checkoutCtrl.isInfo ? "+" : "-"} info")
                  .textColor(appCtrl.appTheme.primary)
                  .fontSize(FontSizes.s12)
                  .gestures(onTap: () {
                checkoutCtrl.isInfo = !checkoutCtrl.isInfo;
                checkoutCtrl.update();
              }),
            ],
          ).marginOnly(bottom: Insets.i15),
          if (!checkoutCtrl.isInfo)
            Text(
              "Novelty! From now on you have the option of picking up an order in the selected InPack parceler. (this is load from the Shipping description, if we dont have just set it blank)",
              overflow: TextOverflow.clip,
            )
                .textColor(appCtrl.appTheme.black)
                .fontSize(FontSizes.s12),
          if (!checkoutCtrl.isInfo) Space(0, 10),
          Divider(
            color:  checkoutCtrl.shippingMethod == "Paszkomaty Inpost"
          ? appCtrl.appTheme.grey
            : appCtrl.appTheme.lightGray,
          )
        ],
      ).marginOnly(left: Insets.i10,top: Insets.i10).backgroundColor(checkoutCtrl.shippingMethod == "Paszkomaty Inpost"
          ? appCtrl.appTheme.grey
          : appCtrl.appTheme.surface),
      leading: Radio(
          value: "Paszkomaty Inpost",
          groupValue: checkoutCtrl.shippingMethod,
          onChanged: (value) {
            checkoutCtrl.shippingMethod = value.toString();
            checkoutCtrl.update();
          }),
    ).gestures(onTap: (){
      checkoutCtrl.shippingMethod = "Paszkomaty Inpost";
      checkoutCtrl.update();
    }));
  }
}
