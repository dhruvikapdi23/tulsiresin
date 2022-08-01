import 'package:tulsiresin/controllers/signup_controller.dart';

import '../../../config.dart';

class CheckBoxLayout extends StatelessWidget {
  const CheckBoxLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<SignupController>(
      builder: (signupCtrl) {
        return CheckboxListTile(
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
          title: const Text('I want to create an account')
              .textColor(appCtrl.appTheme.grayPrimary),
          value: signupCtrl.isCheck,
          onChanged: (bool? value) {
            signupCtrl.isCheck = value!;
            signupCtrl.update();
          },
        );
      }
    );
  }
}
