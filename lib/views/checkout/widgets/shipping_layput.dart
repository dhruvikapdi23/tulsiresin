import 'package:tulsiresin/controllers/checkout_controller.dart';

import 'package:tulsiresin/views/checkout/widgets/city.dart';
import 'package:tulsiresin/views/checkout/widgets/country.dart';
import 'package:tulsiresin/views/checkout/widgets/first_name.dart';
import 'package:tulsiresin/views/checkout/widgets/last_name.dart';
import 'package:tulsiresin/views/checkout/widgets/phone_no.dart';
import 'package:tulsiresin/views/checkout/widgets/shipping_method1.dart';
import 'package:tulsiresin/views/checkout/widgets/shipping_method2.dart';
import 'package:tulsiresin/views/checkout/widgets/shipping_method3.dart';
import 'package:tulsiresin/views/checkout/widgets/shipping_method4.dart';
import 'package:tulsiresin/views/checkout/widgets/state.dart';
import 'package:tulsiresin/views/checkout/widgets/street_name.dart';
import 'package:tulsiresin/views/checkout/widgets/zipcode.dart';
import 'package:tulsiresin/widgets/common/custom_button.dart';
import '../../../config.dart';

class ShippingLayout extends StatelessWidget {
  const ShippingLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(
      builder: (checkoutCtrl) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Shipping')
                .fontSize(FontSizes.s20)
                .textColor(appCtrl.appTheme.black),
            Space(0, 20),
            FirstName(
              controller: checkoutCtrl.txtFirstName,
            ),
            Space(0, 30),
            LastName(
              controller: checkoutCtrl.txtLastName,
            ),
            Space(0, 30),
            Country(
              controller: checkoutCtrl.txtCountry,
            ),
            Space(0, 30),
            StreetName(
              controller: checkoutCtrl.txtStreetName,
            ),
            Space(0, 30),
            City(
              controller: checkoutCtrl.txtCity,
            ),
            Space(0, 30),
            StateProvision(
              controller: checkoutCtrl.txtState,
            ),
            Space(0, 30),
            Zipcode(
              controller: checkoutCtrl.txtZip,
            ),
            Space(0, 30),
            PhoneNo(
              controller: checkoutCtrl.txtPhone,
            ),
            Space(0, 50),
            Text('Shipping method')
                .fontSize(FontSizes.s18)
                .fontWeight(FontWeight.w500),
            Space(0, 20),
            Divider(
              color: appCtrl.appTheme.lightGray,
            ),
            const ShippingMethod1(),
            const ShippingMethod2(),
            const ShippingMethod3(),
            const ShippingMetod4(),
            Space(0, 50),
            Text('Billing Address')
                .fontSize(FontSizes.s18)
                .fontWeight(FontWeight.w500),
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              title: Text("Copy address data from shipping").fontSize(FontSizes.s16),
              value: checkoutCtrl.isCopyAddress,
              onChanged: (newValue) {
                checkoutCtrl.isCopyAddress = newValue!;
                checkoutCtrl.update();
              },
              controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
            ),
            Space(0, 50),
            CustomButton(title: "CONTINUE TO SHIPPING",radius: 0,onTap: (){
              checkoutCtrl.tabIndex = 1;
              checkoutCtrl.update();
            },)
          ],
        ).marginSymmetric(
            horizontal: Insets.i20, vertical: Insets.i20);
      }
    );
  }
}
