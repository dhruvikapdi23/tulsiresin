import '../../../config.dart';

class NameEmailLayout extends StatelessWidget {
  final String? title,value;
  const NameEmailLayout({Key? key,this.value,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Get.toNamed(routeName.editProfile),
      child: Row(
        children: [
           Text(title!)
              .textColor(appCtrl.appTheme.txt)
              .fontSize(FontSizes.s16),
           Text(value!)
              .textColor(appCtrl.appTheme.txt)
              .fontSize(FontSizes.s16),
        ],
      ),
    );
  }
}
