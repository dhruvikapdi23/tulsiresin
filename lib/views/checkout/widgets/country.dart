import 'package:tulsiresin/widgets/common/custom_text_form_field.dart';

import '../../../config.dart';
import '../../../widgets/validation.dart';

class Country extends StatelessWidget {
  final TextEditingController? controller;
  const Country({Key? key,this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      keyboardType: TextInputType.name,
      padding: const EdgeInsets.only(bottom: 10),
      hintText: "Country",
      inputBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: appCtrl.appTheme.lightGray,
        ),
      ),
      suffixIcon:
      const Icon(Icons.keyboard_arrow_down_rounded),
      validator: (val) =>
          Validation().checkCountryValidation(val),
    );
  }
}
