import 'package:tulsiresin/widgets/common/custom_text_form_field.dart';
import 'package:tulsiresin/widgets/validation.dart';

import '../../../config.dart';

class StreetName extends StatelessWidget {
  final TextEditingController? controller;
  const StreetName({Key? key,this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      keyboardType: TextInputType.name,
      padding: const EdgeInsets.only(bottom: 10),
      hintText: "Street name",
      inputBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: appCtrl.appTheme.lightGray,
        ),
      ),
      suffixIcon: const Icon(Icons.location_on_rounded),
      validator: (val) =>
          Validation().checkStreetNameValidation(val),
    );
  }
}
