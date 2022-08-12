import '../../../config.dart';

class CommonTitle extends StatelessWidget {
  final String? title;
  final dynamic category;
  const CommonTitle({Key? key, this.title, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title!).textColor(appCtrl.appTheme.grayPrimary).fontSize(FontSizes.s18),
        Text(CommonFonts().seeAll).textColor(appCtrl.appTheme.primary).fontSize(FontSizes.s18).gestures(
              onTap: () => Get.toNamed(
                routeName.product,
                arguments: {'category': category},
              ),
            ),
      ],
    ).marginSymmetric(horizontal: Insets.i20, vertical: Insets.i30);
  }
}
