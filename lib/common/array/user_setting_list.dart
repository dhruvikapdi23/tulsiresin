import 'package:get/get.dart';
import 'package:tulsiresin/common/assets/index.dart';

var userSettingList = [
  {
    'title': "General Setting".tr,
    'child': [
      {'icon': svgAssets.globe, 'name': 'Language'.tr},

    ]
  },{
    'title': "Personal details".tr,
    'child': [
      {'icon': svgAssets.home, 'name': 'My Address'.tr},
      {'icon': svgAssets.heart, 'name': 'My Wishlist'.tr},
      {'icon': svgAssets.notification, 'name': 'Get Notifications'.tr},
    ]
  },
  {
    'title': 'Order details'.tr,
    'child': [
      {"icon": svgAssets.order, "name": "Order history".tr},
      {"icon": svgAssets.rate, "name": "Rate this app".tr},
      {"icon": svgAssets.logout, "name": "Logout".tr},
    ]
  },
];
