import 'package:tulsiresin/widgets/common/custom_text_form_field.dart';
import 'package:tulsiresin/widgets/validation.dart';

import '../../../config.dart';

class PhoneNo extends StatelessWidget {
  final TextEditingController? controller;
  const PhoneNo({Key? key,this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      keyboardType: TextInputType.phone,
      padding: const EdgeInsets.only(bottom: 10),
      hintText: "Phone number",
      inputBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: appCtrl.appTheme.lightGray,
        ),
      ),
      maxLength: 10,
      validator: (val) =>
          Validation().checkPhoneValidation(val),
    );
  }
}
