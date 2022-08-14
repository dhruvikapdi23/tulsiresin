import 'package:tulsiresin/common/array/product.dart';
import 'package:tulsiresin/config.dart';
import 'package:tulsiresin/controllers/checkout_controller.dart';
import 'package:tulsiresin/views/cart/widgets/cart_list_card.dart';
import 'package:tulsiresin/views/cart/widgets/price_layout.dart';
import 'package:tulsiresin/widgets/common/custom_button.dart';

class ReviewLayout extends StatelessWidget {
  const ReviewLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(
      builder: (checkoutCtrl) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(CommonFonts().shippingAddress).fontSize(FontSizes.s16).textColor(appCtrl.appTheme.black),
                const Icon(Icons.arrow_forward_ios_rounded,size: Insets.i20,)
              ],
            ).marginSymmetric(vertical: Insets.i10),
            Divider(color: appCtrl.appTheme.lightGray,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(CommonFonts().billingAddress).fontSize(FontSizes.s16).textColor(appCtrl.appTheme.black),
                const Icon(Icons.arrow_forward_ios_rounded,size: Insets.i20,)
              ],
            ).marginSymmetric(vertical: Insets.i10),
            Divider(color: appCtrl.appTheme.lightGray,),
            Space(0, 20),
             Text(CommonFonts().billingAddress).fontSize(FontSizes.s18).fontWeight(FontWeight.w600),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               /* ...geReviewProducts.asMap().entries.map((e) {

                  return CartListCard(
                    product: e.value,
                    quantity: "0",
                    optionLength: e.value.options!.length,
                  );
                }).toList(),*/
                 const PriceLayout(isBgColor: false,),
                Space(0, 20),
              ],
            ),
              CustomButton(title: CommonFonts().continuePayment,radius: 0,onTap: (){
                checkoutCtrl.tabIndex = 2;
                checkoutCtrl.update();
              },),
            Space(0, 20),
             Text(CommonFonts().goBackToPayment).textDecoration(TextDecoration.underline).fontSize(FontSizes.s16).alignment(Alignment.center).gestures(onTap: (){
               checkoutCtrl.tabIndex = 0;
               checkoutCtrl.update();
             },),
            Space(0, 20),
          ],
        ).marginSymmetric(horizontal: Insets.i15,vertical: Insets.i15);
      }
    );
  }
}
