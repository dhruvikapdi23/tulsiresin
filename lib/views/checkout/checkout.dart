import 'package:flutter/cupertino.dart';
import 'package:tulsiresin/config.dart';
import 'package:tulsiresin/controllers/checkout_controller.dart';
import 'package:tulsiresin/views/checkout/widgets/payment_layout.dart';
import 'package:tulsiresin/views/checkout/widgets/review_layout.dart';
import 'package:tulsiresin/views/checkout/widgets/shipping_layput.dart';
import 'package:tulsiresin/views/checkout/widgets/tab_layout.dart';

class Checkout extends StatelessWidget {
  final checkoutCtrl = Get.put(CheckoutController());

  Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(builder: (_) {
      return Scaffold(
        backgroundColor: appCtrl.appTheme.surface,
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: appCtrl.appTheme.gray6,
          title: const Text("Checkout"),
          actions: [
            Icon(
              CupertinoIcons.multiply,
              color: appCtrl.appTheme.black.withOpacity(.7),
            ).gestures(onTap: ()=>Get.back()).marginOnly(right: Insets.i15)
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TabLayout(),
              checkoutCtrl.tabIndex == 0
                  ? const ShippingLayout()
                  : checkoutCtrl.tabIndex == 1 ? const ReviewLayout() : const PaymentLayout()
            ],
          ),
        ),
      );
    });
  }
}
