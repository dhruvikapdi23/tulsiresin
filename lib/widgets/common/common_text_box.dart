import 'package:tulsiresin/widgets/common/custom_text_form_field.dart';

import '../../config.dart';

class CommonTextBox extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final String? hintText;
  const CommonTextBox({Key? key,this.controller,this.validator,this.keyboardType,this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      keyboardType: keyboardType,
      padding: const EdgeInsets.only(bottom: 10),
      hintText: hintText,
      labelText: hintText,
      inputBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: appCtrl.appTheme.lightGray,
        ),
      ),
      validator: validator,
    );
  }
}
