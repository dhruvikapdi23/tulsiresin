import '../../../config.dart';

class CheckoutButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  const CheckoutButton({Key? key,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Insets.i10),
      margin: const EdgeInsets.symmetric(horizontal: Insets.i20,vertical: Insets.i8),
      width: Sizes.s120,
      decoration: BoxDecoration(
        color: appCtrl.appTheme.primary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            CommonFonts().checkout,
            style: AppCss.h2.textColor(Colors.white),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),

        ],
      ),
    ).gestures(onTap:onTap );
  }
}
