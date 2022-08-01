import 'package:tulsiresin/widgets/common/custom_text_form_field.dart';
import 'package:tulsiresin/widgets/validation.dart';

import '../../../config.dart';

class Zipcode extends StatelessWidget {
  final TextEditingController? controller;
  const Zipcode({Key? key,this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      padding: const EdgeInsets.only(bottom: 10),
      hintText: "Zip-code",
      inputBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: appCtrl.appTheme.lightGray,
        ),
      ),
      validator: (val) =>
          Validation().checkZipCodeValidation(val),
    );
  }
}
