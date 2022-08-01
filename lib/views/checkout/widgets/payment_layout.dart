import 'package:tulsiresin/config.dart';
import 'package:tulsiresin/controllers/checkout_controller.dart';
import 'package:tulsiresin/views/cart/widgets/price_layout.dart';
import 'package:tulsiresin/widgets/common/custom_button.dart';

class PaymentLayout extends StatelessWidget {
  const PaymentLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(builder: (checkoutCtrl) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Payment methods')
                  .fontSize(FontSizes.s18)
                  .fontWeight(FontWeight.w500),
              Space(0, 5),
              Text('Choose your payment method')
                  .fontSize(FontSizes.s14)
                  .fontWeight(FontWeight.normal),
              Space(0,30),
              ...checkoutCtrl.paymentMethod.asMap().entries.map((e) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,

                  horizontalTitleGap: 15,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(e.value['image']!,height: Sizes.s60,width: Sizes.s120,fit: BoxFit.contain,),
                      Divider(color: appCtrl.appTheme.lightGray,)
                    ],
                  ),
                  leading: Radio(
                      value: e.value['name']!,
                      groupValue: checkoutCtrl.shippingMethod,
                      onChanged: (value) {
                        checkoutCtrl.shippingMethod = value.toString();
                        checkoutCtrl.update();
                      }),
                );
              }).toList(),

            ],
          ).marginSymmetric(horizontal:Insets.i15,vertical: Insets.i15),
         Container(
           color: appCtrl.appTheme.grey,
           child: Column(
             children: [
               const PriceLayout(),
               CheckboxListTile(
                 contentPadding: EdgeInsets.zero,
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(0),
                 ),
                 title: Row(
                   children: [
                     Text("I agree to ").fontSize(FontSizes.s16),
                     Text("Terms and conditions").fontSize(FontSizes.s16).textDecoration(TextDecoration.underline),
                   ],
                 ),
                 value: checkoutCtrl.isCopyAddress,
                 onChanged: (newValue) {
                   checkoutCtrl.isCopyAddress = newValue!;
                   checkoutCtrl.update();
                 },
                 controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
               ).marginSymmetric(horizontal:Insets.i15),
               
               CustomButton(title: "PLACE MY ORDER",color: Color(0xFF333333),radius: 0,onTap: ()=> Get.toNamed(routeName.orderSuccess),).marginSymmetric(horizontal:Insets.i15),
               Space(0, 20),
               Text("Go back to Review").textDecoration(TextDecoration.underline).fontSize(FontSizes.s16).alignment(Alignment.center).gestures(onTap: (){
                 checkoutCtrl.tabIndex = 1;
                 checkoutCtrl.update();
               },),
               Space(0, 20),
             ],
           ),
         ),
        ],
      );
    });
  }
}
