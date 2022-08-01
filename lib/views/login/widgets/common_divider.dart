import '../../../config.dart';

class CommonDivider extends StatelessWidget {
  final double? indent,endIndent;
  const CommonDivider({Key? key,this.endIndent,this.indent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Divider(
        color: appCtrl.appTheme.grayPrimary,
        height: 2,
        indent: indent,
        endIndent: endIndent,
      ),
    );
  }
}
