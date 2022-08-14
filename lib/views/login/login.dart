import 'package:tulsiresin/config.dart';
import 'package:tulsiresin/controllers/login_controller.dart';
import 'package:tulsiresin/views/login/widgets/common_divider.dart';
import 'package:tulsiresin/views/login/widgets/social_icon.dart';
import 'package:tulsiresin/widgets/common/custom_button.dart';
import 'package:tulsiresin/widgets/common/email_text_box.dart';
import 'package:tulsiresin/widgets/common/password_text_box.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>with TickerProviderStateMixin {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  late AnimationController loginButtonController;
  final loginCtrl = Get.put(LoginController());

  @override
  void initState() {
    super.initState();


    loginButtonController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginController>(builder: (_) {
        return SingleChildScrollView(
          child: Container(
            color: appCtrl.appTheme.surface,
            height: MediaQuery.of(context).size.height,
            child: Form(
              key: loginCtrl.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    imageAssets.logo,
                    width: Sizes.s120,
                  ),
                  Space(0, 50),
                  EmailTextBox(
                    controller: loginCtrl.txtEmail,
                  ),
                  Space(0, 20),
                  PasswordTextBox(
                    controller: loginCtrl.txtPassword,
                    passwordVisible: loginCtrl.passwordVisible,
                  ),
                  Space(0, 50),
                  CustomButton(
                    title: "LOG IN",
                    radius: 0,
                    onTap: () {
                      print('tap');
                      if (loginCtrl.formKey.currentState!.validate()) {
                        loginCtrl.checkLogin();
                      }

                    },
                  ),
                  Space(0, 50),
                  Row(
                    children: [
                      const CommonDivider(
                        indent: 40,
                        endIndent: 30,
                      ),
                      const Text("OR").textColor(
                          appCtrl.appTheme.grayPrimary.withOpacity(.7)),
                      const CommonDivider(
                        indent: 30,
                        endIndent: 40,
                      ),
                    ],
                  ),
                  Space(0, 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialIconLayout(
                        icon: iconAssets.facebook,
                      ),
                      Space(50, 0),
                      SocialIconLayout(
                        icon: iconAssets.sms,
                      ),
                    ],
                  ),
                  Space(0, 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?  ")
                          .textColor(appCtrl.appTheme.black)
                          .fontSize(FontSizes.s16),
                      const Text("Sign Up")
                          .textColor(appCtrl.appTheme.green.withOpacity(.6))
                          .fontWeight(FontWeight.w600)
                          .fontSize(FontSizes.s16)
                          .gestures(onTap: () => Get.toNamed(routeName.signup)),
                    ],
                  )
                ],
              ).paddingSymmetric(horizontal: Insets.i30),
            ),
          ),
        );
      }),
    );
  }
}

