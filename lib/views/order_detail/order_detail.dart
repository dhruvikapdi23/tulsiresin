import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:tulsiresin/config.dart';
import 'package:tulsiresin/controllers/order_controller.dart';
import 'package:tulsiresin/widgets/common/custom_button.dart';

class OrderDetail extends StatelessWidget {
  final orderDetailCtrl = Get.put(OrderDetailController());

  OrderDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderDetailController>(builder: (_) {
      return Scaffold(
        backgroundColor: appCtrl.appTheme.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: appCtrl.appTheme.white,
          title:  Text(CommonFonts().orderNumber),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...orderDetailCtrl.orderDetail.lineItems!
                    .asMap()
                    .entries
                    .map((e) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(e.value.name!)
                          .fontSize(FontSizes.s16)
                          .textColor(appCtrl.appTheme.black)
                          .fontWeight(FontWeight.w300),
                      Row(
                        children: [
                          Text("x${e.value.quantity}")
                              .fontSize(FontSizes.s14)
                              .textColor(appCtrl.appTheme.black)
                              .fontWeight(FontWeight.w300),
                          Space(50, 0),
                          Text("\$${e.value.price}")
                              .fontSize(FontSizes.s14)
                              .textColor(appCtrl.appTheme.black)
                              .fontWeight(FontWeight.w700),
                        ],
                      ),
                    ],
                  ).marginSymmetric(vertical: Insets.i10);
                }).toList(),
                Space(0, 30),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Insets.i15, vertical: Insets.i20),
                  color: appCtrl.appTheme.gray6,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Text(CommonFonts().subTotal)
                              .fontSize(FontSizes.s16)
                              .textColor(appCtrl.appTheme.black)
                              .fontWeight(FontWeight.w300),
                          Text(orderDetailCtrl.orderDetail.totalAmount
                                  .toString())
                              .fontSize(FontSizes.s16)
                              .textColor(appCtrl.appTheme.black)
                              .fontWeight(FontWeight.w700),
                        ],
                      ),
                      Space(0, 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Text(CommonFonts().shipping)
                              .fontSize(FontSizes.s16)
                              .textColor(appCtrl.appTheme.black)
                              .fontWeight(FontWeight.w300),
                          Text(orderDetailCtrl.orderDetail.shippingCharges
                                  .toString())
                              .fontSize(FontSizes.s16)
                              .textColor(appCtrl.appTheme.black)
                              .fontWeight(FontWeight.w700),
                        ],
                      ),
                      Space(0, 10),
                      Divider(
                        color: appCtrl.appTheme.black.withOpacity(.6),
                      ),
                      Space(0, 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Text(CommonFonts().total)
                              .fontSize(FontSizes.s16)
                              .textColor(appCtrl.appTheme.black)
                              .fontWeight(FontWeight.w300),
                          Text(orderDetailCtrl.orderDetail.totalAmount
                                  .toString())
                              .fontSize(FontSizes.s16)
                              .textColor(appCtrl.appTheme.black)
                              .fontWeight(FontWeight.w700),
                        ],
                      ),
                    ],
                  ),
                ),
                Space(0, 30),
               /* Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(CommonFonts().status)
                        .fontWeight(FontWeight.bold)
                        .fontSize(FontSizes.s18)
                        .textColor(appCtrl.appTheme.black),
                    Text(orderDetailCtrl.orderDetail.status!.toUpperCase())
                        .fontWeight(FontWeight.bold)
                        .fontSize(FontSizes.s18)
                        .textColor(appCtrl.appTheme.statusColor),
                  ],
                ),
                Space(0, 30),
                FittedBox(
                  child: LinearPercentIndicator(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.zero,
                    lineHeight: 14.0,
                    percent: 0.5,
                    barRadius: const Radius.circular(7),
                    backgroundColor: appCtrl.appTheme.graySecondary,
                    progressColor: appCtrl.appTheme.statusColor,
                  ),
                ),
                Space(0, 30),*/
                 Text(CommonFonts().shippingAddress)
                    .fontWeight(FontWeight.bold)
                    .fontSize(FontSizes.s18)
                    .textColor(appCtrl.appTheme.black),
                Space(0, 10),
                Text('${orderDetailCtrl.orderDetail.shippingAddress!.name!} ${orderDetailCtrl.orderDetail.shippingAddress!.address1!} ${orderDetailCtrl.orderDetail.shippingAddress!.city}, ${orderDetailCtrl.orderDetail.shippingAddress!.country}, ${orderDetailCtrl.orderDetail.shippingAddress!.zip}')
                    .fontWeight(FontWeight.w300)
                    .fontSize(FontSizes.s14)
                    .textColor(appCtrl.appTheme.black),
                Space(0, 30),
                 Text(CommonFonts().orderNotes)
                    .fontWeight(FontWeight.bold)
                    .fontSize(FontSizes.s18)
                    .textColor(appCtrl.appTheme.black),
                Space(0, 10),
                 Text(
                 CommonFonts().orderNoteDesc,
                  overflow: TextOverflow.clip,
                )
                    .fontWeight(FontWeight.w300)
                    .fontSize(FontSizes.s14)
                    .textColor(appCtrl.appTheme.black),
                Space(0, 30),
               /* CustomButton(title: CommonFonts().refundRequest,radius: 0,),
                Space(0, 30),*/
              ],
            ).marginSymmetric(horizontal: Insets.i15,vertical: Insets.i10),
          ),
        ),
      );
    });
  }
}
