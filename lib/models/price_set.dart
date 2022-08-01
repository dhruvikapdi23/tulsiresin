import '../config.dart';

class PriceSet {
  ShopMoney? shopMoney;
  ShopMoney? presentmentMoney;

  PriceSet({this.shopMoney, this.presentmentMoney});

  PriceSet.fromJson(Map<String, dynamic> json) {
    shopMoney = json['shop_money'] != null
        ? ShopMoney.fromJson(json['shop_money'])
        : null;
    presentmentMoney = json['presentment_money'] != null
        ? ShopMoney.fromJson(json['presentment_money'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (shopMoney != null) {
      data['shop_money'] = shopMoney!.toJson();
    }
    if (presentmentMoney != null) {
      data['presentment_money'] = presentmentMoney!.toJson();
    }
    return data;
  }
}
