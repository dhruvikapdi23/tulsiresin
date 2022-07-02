import 'package:tulsiresin/config.dart';
import 'package:tulsiresin/controllers/signup_controller.dart';
import 'package:tulsiresin/widgets/common/custom_button.dart';
import 'package:tulsiresin/widgets/common/custom_text_form_field.dart';
import 'package:tulsiresin/widgets/common/email_text_box.dart';
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
            color: appCtrl.appTheme.white,
            child: Form(
              key: signupCtrl.signupFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    imageAssets.logo,
                    width: Sizes.s120,
                  ),
                  Space(0, 50),
                  EmailTextBox(
                    controller: signupCtrl.txtEmail,
                  ),
                  Space(0, 20),
                  CustomTextFormField(
                    controller: signupCtrl.txtFirstName,
                    keyboardType: TextInputType.text,
                    padding: const EdgeInsets.only(bottom: 10),
                    hintText: "First name *",
                    inputBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: appCtrl.appTheme.lightGray,
                      ),
                    ),
                    validator: (val) =>
                        Validation().checkFirstNameValidation(val),
                  ),
                  Space(0, 20),
                  CustomTextFormField(
                    controller: signupCtrl.txtFirstName,
                    keyboardType: TextInputType.text,
                    padding: const EdgeInsets.only(bottom: 10),
                    hintText: "Last name *",
                    inputBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: appCtrl.appTheme.lightGray,
                      ),
                    ),
                    validator: (val) =>
                        Validation().checkLastNameValidation(val),
                  ),
                  Space(0, 20),
                  PasswordTextBox(
                    controller: signupCtrl.txtPassword,
                    passwordVisible: false,
                    isSuffixIconShow: false,
                  ),
                  Space(0, 40),
                  CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    checkboxShape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                    ),
                    side: BorderSide(
                      color: appCtrl.appTheme.grayPrimary,
                      //your desire colour here
                      width: 1,
                    ),

                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text('I want to create an account').textColor(appCtrl.appTheme.grayPrimary),
                    value: signupCtrl.isCheck,
                    onChanged: (bool? value) {
                      signupCtrl.isCheck = value!;
                      signupCtrl.update();
                    },
                  ),
                  Space(0, 30),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("or ")
                          .textColor(appCtrl.appTheme.black)
                          .fontSize(FontSizes.s16),
                      const Text("log in to your account")
                          .textColor(appCtrl.appTheme.black)
                          .fontWeight(FontWeight.w600)
                          .fontSize(FontSizes.s16).textDecoration(TextDecoration.underline).gestures(onTap: ()=> Get.back()),
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
