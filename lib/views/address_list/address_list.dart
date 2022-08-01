import 'package:flutter/cupertino.dart';
import 'package:tulsiresin/config.dart';
import 'package:tulsiresin/controllers/add_address_controller.dart';
import 'package:tulsiresin/widgets/common/custom_text_form_field.dart';

class AddressList extends StatelessWidget {
  final addressListCtrl = Get.put(AddAddressController());

  AddressList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddAddressController>(builder: (_) {
      return Scaffold(
        backgroundColor: appCtrl.appTheme.white,
        appBar: AppBar(
          backgroundColor: appCtrl.appTheme.white,
          elevation: 0,
          centerTitle: true,
          title: Text(CommonFonts().addressList),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextFormField(
                radius: AppRadius.r50,
                //  controller: categoryCtrl.txtSearch,
                fillColor: appCtrl.appTheme.grey,
                hintText: CommonFonts().searchForItem,
                // onChanged: (val) => categoryCtrl.searchList(val),
                prefixIcon: SvgPicture.asset(svgAssets.search),
                inputBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              Space(0, 20),
              ...addressListCtrl.addressList.asMap().entries.map((e) {
                return InkWell(
                  onTap: ()=>addressListCtrl.selectedAddressTap(e.key),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: Insets.i20),
                    padding: const EdgeInsets.symmetric(horizontal: Insets.i15,vertical: Insets.i15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppRadius.r5),
                        border: Border.all(
                            color: addressListCtrl.selectedAddress == e.key
                                ? appCtrl.appTheme.primary
                                : appCtrl.appTheme.gray6)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(e.value['addressType'] == "Home"
                                ? Icons.home
                                : Icons.business_center_outlined),
                            Space(10, 0),
                            Text(e.value['addressType'].toString()).textColor(appCtrl.appTheme.primary)
                          ],
                        ),
                        Space(0, 10),
                        Text(
                            '${e.value['address1']}, ${e.value['address2']}, ${e.value['address3']}, ${e.value['city']}, ${e.value['state']} - ${e.value['pincode']}'),
                        Space(0, 20),
                        Text(e.value['phoneNo'].toString())
                      ],
                    ),
                  ),
                );
              }).toList()
            ],
          ).marginSymmetric(horizontal: Insets.i15),
        ),
      );
    });
  }
}
