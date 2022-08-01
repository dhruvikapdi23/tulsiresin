import '../../../config.dart';

class TopLayout extends StatelessWidget {
  const TopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: <Widget>[
        // background image and bottom contents
        Container(
          height: Sizes.s150,
          color: appCtrl.appTheme.linear,
        ),
        // Profile image
        Positioned(
          top: Insets.i100,
          // (background container size) - (circle height / 2)
          child: Container(
            alignment: Alignment.center,
            height: Sizes.s100,
            width: Sizes.s100,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: appCtrl.appTheme.black),
            child: const Text("JS")
                .fontWeight(FontWeight.w700)
                .textColor(appCtrl.appTheme.surface)
                .fontSize(FontSizes.s18),
          ),
        )
      ],
    );
  }
}
