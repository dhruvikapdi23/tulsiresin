import 'package:tulsiresin/config.dart';
import 'package:tulsiresin/controllers/signup_controller.dart';
import 'package:tulsiresin/views/signup/widgets/checkbox_layout.dart';
import 'package:tulsiresin/views/signup/widgets/login_text_layout.dart';
import 'package:tulsiresin/widgets/common/custom_button.dart';
import 'package:tulsiresin/widgets/common/email_text_box.dart';
import 'package:tulsiresin/widgets/common/common_text_box.dart';
import 'package:tulsiresin/widgets/common/password_text_box.dart';
import 'package:tulsiresin/widgets/validation.dart';

class Signup extends StatelessWidget {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  final signupCtrl = Get.put(SignupController());

  Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SignupController>(builder: (_) {
        return SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: appCtrl.appTheme.surface,
            child: Form(
              key: signupCtrl.signupFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //logo
                  Image.asset(
                    imageAssets.logo,
                    width: Sizes.s120,
                  ),
                  Space(0, 50),
                  //email text box layout
                  EmailTextBox(
                    controller: signupCtrl.txtEmail,
                  ),
                  Space(0, 20),
                  //first name text box layout
                  CommonTextBox(
                    controller: signupCtrl.txtFirstName,
                    keyboardType: TextInputType.text,
                    validator: (val) =>
                        Validation().checkLastNameValidation(val),
                    hintText: "First name",
                  ),
                  Space(0, 20),

                  //last name text box layout
                  CommonTextBox(
                    controller: signupCtrl.txtLastName,
                    keyboardType: TextInputType.text,
                    validator: (val) =>
                        Validation().checkLastNameValidation(val),
                    hintText: "Last name",
                  ),
                  Space(0, 20),

                  //password text box layout
                  PasswordTextBox(
                    controller: signupCtrl.txtPassword,
                    passwordVisible: false,
                    isSuffixIconShow: false,
                  ),
                  Space(0, 40),

                  //checkbox layout
                  const CheckBoxLayout(),
                  Space(0, 30),

                  //button layout
                  CustomButton(
                    title: "CREATE AN ACCOUNT",
                    radius: 0,
                    onTap: () {
                      if (signupCtrl.signupFormKey.currentState!.validate()) {
                        signupCtrl.checkLogin();
                      }
                    },
                  ),
                  Space(0, 20),

                  //login text layout
                 const LoginTextLayout()
                ],
              ).paddingSymmetric(horizontal: Insets.i30),
            ),
          ),
        );
      }),
    );
  }
}
