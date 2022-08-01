import 'package:tulsiresin/config.dart';

class AddAddressController extends GetxController {
  int selectedAddress =0;
  var addressList = [
    {
      "addressType": "Home",
      "address1":"222, Saraswati",
      "address2": "Rustampura Motto Mohallow",
      "address3":"near AAA Hospital",
      "city": "Surat",
      "state": "Gujarat",
      "country": "India",
      "pincode":234553,
      "phoneNo":"3595939595"
    },
    {
      "addressType": "Office",
      "address1":"222, Saraswati",
      "address2": "Rustampura Motto Mohallow",
      "address3":"near AAA Hospital",
      "city": "Surat",
      "state": "Gujarat",
      "country": "India",
      "pincode":234553,
      "phoneNo":"3595939595"
    }
  ];

  //selectedAddressTap
  selectedAddressTap(index){
    selectedAddress = index;
    update();
  }
}
