import 'package:tulsiresin/common/array/order_history_array.dart';
import 'package:tulsiresin/config.dart';
import 'package:tulsiresin/views/order_history/widgets/order_history_card.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading:
            const Icon(Icons.arrow_back_ios).gestures(onTap: () => Get.back()),
        backgroundColor: appCtrl.appTheme.gray6,
        title: const Text("Order history"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text('3 Items')
                .fontSize(FontSizes.s14)
                .textColor(appCtrl.appTheme.grayPrimary),
            ...orderHistoryArray.asMap().entries.map((e) {
              return InkWell(
                  onTap: () => Get.toNamed(routeName.orderDetail),
                  child: OrderHistoryCard(
                    data: e.value,
                  ).gestures(onTap: () => Get.toNamed(routeName.orderDetail)));
            }).toList()
          ],
        ).marginSymmetric(horizontal: Insets.i15, vertical: Insets.i15),
      ),
    );
  }
}
