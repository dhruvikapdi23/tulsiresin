import '../../../config.dart';

class LoginTextLayout extends StatelessWidget {
  const LoginTextLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("or ")
            .textColor(appCtrl.appTheme.black)
            .fontSize(FontSizes.s16),
        const Text("log in to your account")
            .textColor(appCtrl.appTheme.black)
            .fontWeight(FontWeight.w600)
            .fontSize(FontSizes.s16)
            .textDecoration(TextDecoration.underline)
            .gestures(onTap: () => Get.back()),
      ],
    );
  }
}
