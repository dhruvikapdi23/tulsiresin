import 'package:tulsiresin/widgets/common/custom_text_form_field.dart';
import 'package:tulsiresin/widgets/validation.dart';

import '../../../config.dart';

class NameTextBox extends StatelessWidget {
  final TextEditingController? controller;
  const NameTextBox({Key? key,this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      padding: const EdgeInsets.only(bottom: 10),
      hintText: "Name",
      labelText: "Name",
      inputBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: appCtrl.appTheme.lightGray,
        ),
      ),
      validator: (val)=> Validation().checkNameValidation(val),
    );
  }
}
