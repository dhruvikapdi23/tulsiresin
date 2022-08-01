import 'package:get/get.dart';
import 'package:tulsiresin/config.dart';


//app file


import 'route_name.dart';
import 'screen_list.dart';

RouteName _routeName = RouteName();

class AppRoute {
  final List<GetPage> getPages = [
    GetPage(name: _routeName.dashboard, page: () => const Index()),
    GetPage(name: _routeName.login, page: () => LoginScreen()),
    GetPage(name: _routeName.signup, page: () => Signup()),
    GetPage(name: _routeName.productDetail, page: () => ProductDetail()),
    GetPage(name: _routeName.checkOut, page: () => Checkout()),
    GetPage(name: _routeName.orderSuccess, page: () =>const OrderSuccess()),
    GetPage(name: _routeName.orderHistory, page: () =>const OrderHistory()),
    GetPage(name: _routeName.wishList, page: () => WishList()),
    GetPage(name: _routeName.notification, page: () => const NotificationPage()),
    GetPage(name: _routeName.orderDetail, page: () =>  OrderDetail()),
    GetPage(name: _routeName.product, page: () =>  Product()),
    GetPage(name: _routeName.editProfile, page: () =>  EditProfile()),
    GetPage(name: _routeName.addressList, page: () =>  AddressList()),
  ];
}
