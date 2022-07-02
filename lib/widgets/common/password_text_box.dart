import 'package:tulsiresin/widgets/common/custom_text_form_field.dart';
import 'package:tulsiresin/widgets/validation.dart';

import '../../config.dart';

class PasswordTextBox extends StatelessWidget {
  final TextEditingController? controller;
  final bool isSuffixIconShow;
  final bool passwordVisible;

  const PasswordTextBox(
      {Key? key,
      this.controller,
      this.passwordVisible = false,
      this.isSuffixIconShow = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      obscureText: passwordVisible,
      suffixIcon: isSuffixIconShow
          ? Text(
              'Forgotten?',
              style: TextStyle(
                  color: appCtrl.appTheme.grayPrimary,
                  decoration: TextDecoration.underline),
            )
          : null,
      keyboardType: TextInputType.visiblePassword,
      padding: const EdgeInsets.only(bottom: 10),
      hintText: "Password *",
      inputBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: appCtrl.appTheme.lightGray,
        ),
      ),
      validator: (val) => Validation().checkPasswordValidation(val),
    );
  }
}
