import 'package:tulsiresin/config.dart';

class HomeController extends GetxController {
  List<ProductViewModel> recentView = [];
  List<ProductViewModel> womenCollection = [];

  @override
  void onReady() {
    // TODO: implement onReady
    recentView = recentViewList;
    womenCollection = womenCollectionList;
    update();
    super.onReady();
  }
}
