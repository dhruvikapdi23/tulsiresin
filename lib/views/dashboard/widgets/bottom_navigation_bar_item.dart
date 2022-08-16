import '../../../config.dart';

BottomNavigationBarItem bottomNavigationBarItem(selectedIndex, icon, index, count) {
  return BottomNavigationBarItem(
      icon: Stack(
        alignment: Alignment.topRight,
        children: [
          SvgPicture.asset(
            icon,
            color: selectedIndex == index ? appCtrl.appTheme.primary : appCtrl.appTheme.black.withOpacity(.5),
          ),
          if (count.toString().isNotEmpty)
            Positioned(
              left: 10,
              child: Container(
                height: Sizes.s15,
                width: Sizes.s15,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(AppRadius.r20)),
                child: Text('$count').textColor(appCtrl.appTheme.surface).fontSize(FontSizes.s10),
              ),
            )
        ],
      ),
      label: "");
}
