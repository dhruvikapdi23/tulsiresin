import '../config.dart';

class OrderDetailModel {
  List<LineItems>? lineItems;
  double? totalAmount;
  double? shippingCharges;
  ShippingAddress? shippingAddress;
  String? status;

  OrderDetailModel(
      {this.lineItems,
        this.totalAmount,
        this.shippingCharges,
        this.shippingAddress,this.status});

  OrderDetailModel.fromJson(Map<String, dynamic> json) {
    if (json['line_items'] != null) {
      lineItems = <LineItems>[];
      json['line_items'].forEach((v) {
        lineItems!.add(LineItems.fromJson(v));
      });
    }
    totalAmount = json['totalAmount'];
    shippingCharges = json['shippingCharges'];
    status = json['status'];
    shippingAddress = json['shipping_address'] != null
        ? ShippingAddress.fromJson(json['shipping_address'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (lineItems != null) {
      data['line_items'] = lineItems!.map((v) => v.toJson()).toList();
    }
    data['totalAmount'] = totalAmount;
    data['shippingCharges'] = shippingCharges;
    data['status'] = status;
    if (shippingAddress != null) {
      data['shipping_address'] = shippingAddress!.toJson();
    }
    return data;
  }
}


