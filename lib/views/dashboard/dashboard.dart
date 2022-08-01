import 'package:tulsiresin/controllers/dashboard_controller.dart';
import 'package:tulsiresin/views/dashboard/widgets/bottom_navigation_bar_item.dart';

import '../../config.dart';

class Dashboard extends StatelessWidget {
  final dashboardCtrl = Get.put(DashboardController());

  Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetBuilder<DashboardController>(builder: (_) {
      return WillPopScope(
        onWillPop: () async{
          return false;
        },
        child: Scaffold(

          body:
              dashboardCtrl.widgetOptions.elementAt(dashboardCtrl.selectedIndex),
          bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,

            items: <BottomNavigationBarItem>[
              bottomNavigationBarItem(
                  dashboardCtrl.selectedIndex, svgAssets.home,0),
              bottomNavigationBarItem(
                  dashboardCtrl.selectedIndex, svgAssets.categories,1),
              bottomNavigationBarItem(
                  dashboardCtrl.selectedIndex, svgAssets.bottomSearch,2),
              bottomNavigationBarItem(
                  dashboardCtrl.selectedIndex, svgAssets.cart,3),
              bottomNavigationBarItem(
                  dashboardCtrl.selectedIndex, svgAssets.user,4),
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: dashboardCtrl.selectedIndex,
            iconSize: 40,
            onTap: (value) => dashboardCtrl.bottomNavigationChange(value),
          ),
        ),
      );
    });
  }
}
