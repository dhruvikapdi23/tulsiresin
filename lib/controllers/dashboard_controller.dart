import 'package:tulsiresin/config.dart';
import 'package:tulsiresin/views/cart/cart.dart';
import 'package:tulsiresin/views/category/category.dart';
import 'package:tulsiresin/views/home/home.dart';
import 'package:tulsiresin/views/search/search.dart';
import 'package:tulsiresin/views/user/user.dart';

class DashboardController extends GetxController {
  int selectedIndex = 0;

  //list of bottomnavigator page
  List<Widget> widgetOptions = <Widget>[ Home(),  Category(), Search(), Cart(), const User()];

  bottomNavigationChange(val){
    selectedIndex = val;
    update();
  }
}
