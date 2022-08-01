import '../../../config.dart';
import 'package:tulsiresin/widgets/common/custom_text_form_field.dart';
import 'package:tulsiresin/widgets/validation.dart';

class City extends StatelessWidget {
  final TextEditingController? controller;
  const City({Key? key,this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      keyboardType: TextInputType.name,
      padding: const EdgeInsets.only(bottom: 10),
      hintText: "City",
      inputBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: appCtrl.appTheme.lightGray,
        ),
      ),
      validator: (val) =>
          Validation().checkStreetNameValidation(val),
    );
  }
}
