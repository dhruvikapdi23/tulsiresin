import '../config.dart';
import '../controllers/splash_controller.dart';

// ignore: must_be_immutable
class SplashScreen extends StatelessWidget {
  final splashCtrl = Get.put(SplashController());
  final appCtrl = Get.isRegistered<AppController>() ? Get.find<AppController>() : Get.put(AppController());

  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double animationWidth = ((screenWidth - 200) * 0.5);
    double animationHeight = ((screenHeight - 150) * 0.3);

    return Scaffold(
      backgroundColor: appCtrl.appTheme.surface,
      body: GetBuilder<SplashController>(
        builder: (_) => Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imageAssets.logo,width: Sizes.s120,),
              Padding(
                padding: const EdgeInsets.only(top: Insets.i10),
                child: Text(
                  'TULSI RESIN',
                  maxLines: 2,
                  style: AppCss.h1.copyWith(color: appCtrl.appTheme.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
