import '../../../config.dart';

class PriceTextLayout extends StatelessWidget {
  final String? title,value;

  const PriceTextLayout({Key? key,this.value,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title!)
            .textColor(appCtrl.appTheme.grayPrimary)
            .fontSize(FontSizes.s16),
        Text(value!)
            .textColor(appCtrl.appTheme.txt)
            .fontSize(FontSizes.s16)
      ],
    ).marginOnly(bottom: Insets.i10);
  }
}
