import '../../../config.dart';

class CommonTab extends StatelessWidget {
  final GestureTapCallback? onTap;
  final int? tabIndex;
  final String? text;
  final int? index;
  const CommonTab({Key? key,this.onTap,this.tabIndex,this.text,this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 13),
              child: Text(
                text!,
                style: TextStyle(
                    color: tabIndex == index
                        ? appCtrl.appTheme.black
                        : appCtrl.appTheme.secondaryGray,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            tabIndex! >= index!
                ? ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(2.0),
                  bottomLeft: Radius.circular(2.0)),
              child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: 3.0,
                  color: appCtrl.appTheme.black),
            )
                : Divider(
                height: 2,
                color: appCtrl.appTheme.secondaryGray)
          ],
        ),
      ),
    );
  }
}
