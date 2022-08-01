import '../../../config.dart';

class OrderHistoryCard extends StatelessWidget {
  final dynamic data;
  const OrderHistoryCard({Key? key,this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: Insets.i15),
          padding: const EdgeInsets.symmetric(horizontal: Insets.i15,vertical: Insets.i15),
          color: appCtrl.appTheme.gray6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(data['orderNo'].toString())
                  .fontSize(FontSizes.s16)
                  .textColor(appCtrl.appTheme.black),
              const Icon(Icons.arrow_forward_ios_rounded,size: Sizes.s20,color: Color(0XFF838092),)
            ],
          ),
        ),
        Space(0, 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(CommonFonts().orderDate).fontSize(FontSizes.s16),
            Text(data['date']!).fontSize(FontSizes.s16).fontWeight(FontWeight.w600),
          ],
        ).marginSymmetric(horizontal: Insets.i20),
        Space(0, 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(CommonFonts().status).fontSize(FontSizes.s16),
            Text(data['status']!).fontSize(FontSizes.s16).fontWeight(FontWeight.w600).textColor(appCtrl.appTheme.green),
          ],
        ).marginSymmetric(horizontal: Insets.i20),
        Space(0, 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(CommonFonts().paymentMethod).fontSize(FontSizes.s16),
            Text(data['paymentMethod']!).fontSize(FontSizes.s16).fontWeight(FontWeight.w600),
          ],
        ).marginSymmetric(horizontal: Insets.i20),
        Space(0, 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(CommonFonts().total).fontSize(FontSizes.s16),
            Text(data['total']!).fontSize(FontSizes.s16).fontWeight(FontWeight.w600),
          ],
        ).marginSymmetric(horizontal: Insets.i20)
      ],
    ).marginSymmetric(vertical: Insets.i20).gestures(onTap: ()=> Get.toNamed(routeName.orderDetail));
  }
}
