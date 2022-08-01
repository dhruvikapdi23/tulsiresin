import 'package:tulsiresin/controllers/checkout_controller.dart';
import 'package:tulsiresin/views/checkout/widgets/common_tab.dart';

import '../../../config.dart';

class TabLayout extends StatelessWidget {
  const TabLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   GetBuilder<CheckoutController>(
      builder: (checkoutCtrl) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            CommonTab(onTap:  () {
              checkoutCtrl.tabIndex = 0;
              checkoutCtrl.update();
            },tabIndex: checkoutCtrl.tabIndex,text: "SHIPPING",index: 0,),
            CommonTab(onTap:  () {
              checkoutCtrl.tabIndex = 1;
              checkoutCtrl.update();
            },tabIndex: checkoutCtrl.tabIndex,text: "REVIEW",index: 1,),
            CommonTab(onTap:  () {
              checkoutCtrl.tabIndex = 2;
              checkoutCtrl.update();
            },tabIndex: checkoutCtrl.tabIndex,text: "PAYMENT",index: 2,),

          ],
        );
      }
    );
  }
}
