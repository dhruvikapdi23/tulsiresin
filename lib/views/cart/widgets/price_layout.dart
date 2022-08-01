import 'package:tulsiresin/views/cart/widgets/price_text_layout.dart';

import '../../../config.dart';

class PriceLayout extends StatelessWidget {
  final bool isBgColor;
  const PriceLayout({Key? key,this.isBgColor = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: Insets.i20),

      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color:isBgColor? appCtrl.appTheme.grey: appCtrl.appTheme.surface,
          borderRadius: BorderRadius.circular(AppRadius.r3)),
      child: Column(
        children: [
          if(isBgColor)
           PriceTextLayout(
            title: CommonFonts().products,
            value: 'x3',
          ),
           PriceTextLayout(
            title: CommonFonts().subtotal,
            value: '\$ 150.00',
          ),
           PriceTextLayout(
            title: CommonFonts().shipping,
            value: 'free',
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                Text(CommonFonts().total)
                  .textColor(appCtrl.appTheme.grayPrimary)
                  .fontSize(FontSizes.s14).textColor(appCtrl.appTheme.black).fontWeight(FontWeight.w600),
              const Text("\$ 150.00")
                  .textColor(appCtrl.appTheme.txt)
                  .fontSize(FontSizes.s18).textColor(appCtrl.appTheme.black).fontWeight(FontWeight.w600),
            ],
          ).marginOnly(bottom: Insets.i10,top: Insets.i10),
        ],
      ).marginSymmetric(horizontal: Insets.i20,vertical: Insets.i20),
    );
  }
}
