class ShopMoney {
  String? amount;
  String? currencyCode;

  ShopMoney({this.amount, this.currencyCode});

  ShopMoney.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    currencyCode = json['currency_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['currency_code'] = currencyCode;
    return data;
  }
}
