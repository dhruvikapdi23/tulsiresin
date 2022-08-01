import '../../../config.dart';

class CommonDetail extends StatelessWidget {
  final String? title,value;
  const CommonDetail({Key? key,this.value,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(

      children: [
        Text(title!)
            .textColor(appCtrl.appTheme.txt)
            .fontSize(FontSizes.s12),
        Space(10,0),
        Text(value!)
            .textColor(appCtrl.appTheme.txt)
            .fontSize(FontSizes.s12),
      ],
    ).marginSymmetric(horizontal: Insets.i15,vertical: Insets.i8);
  }
}
