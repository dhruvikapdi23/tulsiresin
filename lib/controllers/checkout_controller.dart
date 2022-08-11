import 'package:tulsiresin/common/array/product.dart';
import 'package:tulsiresin/config.dart';
import 'package:tulsiresin/models/product.dart';

class CheckoutController extends GetxController {
  int tabIndex = 0;
  bool isPayment = false;
  double shippingHeight = 0;
  double reviewHeight = 0;
  double paymentHeight = 0;
  String? shippingMethod;

  bool isInfo = false;
  bool isCopyAddress = false;
  List<ProductModel> cartList = [];
  String? value;
  var paymentMethod = [
    {
      "image": imageAssets.paymentMethod1,
      'name': "payPal"
    },
    {
      "image": imageAssets.paymentMethod2,
      'name': "stripe"
    },
    {
      "image": imageAssets.paymentMethod3,
      'name': "razorpay"
    }
  ];

  //text controller
  TextEditingController txtFirstName = TextEditingController();
  TextEditingController txtLastName = TextEditingController();
  TextEditingController txtCountry = TextEditingController();
  TextEditingController txtCity = TextEditingController();
  TextEditingController txtStreetName = TextEditingController();
  TextEditingController txtZip = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  TextEditingController txtState = TextEditingController();

  @override
  void onReady() {
    // TODO: implement onReady

    update();
    super.onReady();
  }
}
