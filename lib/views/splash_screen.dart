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
      backgroundColor: appCtrl.appTheme.white,
      body: GetBuilder<SplashController>(
        builder: (_) => Stack(
          children: [
            AnimatedPositioned(
              left: splashCtrl.positionAnimation ? animationWidth : -50,
              bottom: splashCtrl.positionAnimation ? animationHeight : 0,
              duration: const Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              onEnd: () => splashCtrl.showLabel(),
              child: SizedBox(
                width: 200,
                height: 200,
                child: Column(
                  children: [
                    Image.asset(imageAssets.logo,width: Sizes.s120,),
                    AnimatedOpacity(
                      opacity: splashCtrl.appTitleOpacity,
                      duration: Durations.slower,
                      onEnd: () => splashCtrl.animateLoading(),
                      child: Padding(
                        padding: const EdgeInsets.only(top: Insets.i10),
                        child: Text(
                          'TULSI RESIN',
                          maxLines: 2,
                          style: AppCss.h1.copyWith(color: appCtrl.appTheme.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
