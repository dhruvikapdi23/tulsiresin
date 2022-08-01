import '../../../config.dart';

class CommonTitle extends StatelessWidget {
  final String? title;
  const CommonTitle({Key? key,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title!)
            .textColor(appCtrl.appTheme.grayPrimary)
            .fontSize(FontSizes.s18),
         Text(CommonFonts().seeAll)
            .textColor(appCtrl.appTheme.primary)
            .fontSize(FontSizes.s18).gestures(onTap: ()=> Get.toNamed(routeName.product)),
      ],
    ).marginSymmetric(horizontal: Insets.i20, vertical: Insets.i30);
  }
}
