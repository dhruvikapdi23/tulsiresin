import 'package:flutter/cupertino.dart';
import 'package:tulsiresin/common/array/notification_array.dart';
import 'package:tulsiresin/config.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appCtrl.appTheme.gray6,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading:
            const Icon(Icons.arrow_back_ios).gestures(onTap: () => Get.back()),
        backgroundColor: appCtrl.appTheme.gray6,
        title: const Text("Notification"),
      ),
      body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('2 Items')
              .fontSize(FontSizes.s14)
              .textColor(appCtrl.appTheme.grayPrimary),
          const Divider(),
          ...notificationArray.asMap().entries.map((e) {
            return Container(
              margin: EdgeInsets.only(bottom: Insets.i15),
              padding: EdgeInsets.symmetric(
                  horizontal: Insets.i15, vertical: Insets.i15),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: appCtrl.appTheme.surface,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(AppRadius.r5)),
              child: Column(
                children: [
                  Row(
                    children: [
                      e.value['isRead'] == true
                          ? SvgPicture.asset(svgAssets.notifications,color: appCtrl.appTheme.grayPrimary,)
                          : SvgPicture.asset(svgAssets.notifications),
                      Space(15, 0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(e.value['title'].toString())
                              .fontSize(FontSizes.s16)
                              .fontWeight(FontWeight.w600),
                          Space(0, 5),
                          Text(
                            e.value['desc'].toString(),
                            overflow: TextOverflow.clip,
                          ).width(MediaQuery.of(context).size.width  /1.5),
                          Space(0, 15),
                          Text(
                            e.value['date'].toString(),
                            overflow: TextOverflow.clip,
                          ).fontSize(FontSizes.s10).textColor(appCtrl.appTheme.grayPrimary)
                        ],
                      )
                    ],
                  )
                ],
              ),
            );
          }).toList()
        ],
      ).marginSymmetric(horizontal: Insets.i15, vertical: Insets.i15)),
    );
  }
}
