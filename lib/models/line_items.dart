import '../config.dart';

class LineItems {
  String? id;
  String? adminGraphqlApiId;
  String? fulfillableQuantity;
  String? fulfillmentService;
  String? fulfillmentStatus;
  bool? giftCard;
  String? grams;
  String? name;
  double? price;
  PriceSet? priceSet;
  bool? productExists;
  String? productId;
  String? quantity;
  bool? requiresShipping;
  String? sku;
  bool? taxable;
  String? title;
  String? totalDiscount;
  PriceSet? totalDiscountSet;
  String? variantId;
  String? variantInventoryManagement;
  String? variantTitle;
  String? vendor;


  LineItems(
      {this.id,
        this.adminGraphqlApiId,
        this.fulfillableQuantity,
        this.fulfillmentService,
        this.fulfillmentStatus,
        this.giftCard,
        this.grams,
        this.name,
        this.price,
        this.priceSet,
        this.productExists,
        this.productId,
        this.quantity,
        this.requiresShipping,
        this.sku,
        this.taxable,
        this.title,
        this.totalDiscount,
        this.totalDiscountSet,
        this.variantId,
        this.variantInventoryManagement,
        this.variantTitle,
        this.vendor,});

  LineItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adminGraphqlApiId = json['admin_graphql_api_id'];
    fulfillableQuantity = json['fulfillable_quantity'];
    fulfillmentService = json['fulfillment_service'];
    fulfillmentStatus = json['fulfillment_status'];
    giftCard = json['gift_card'];
    grams = json['grams'];
    name = json['name'];
    price = json['price'];
    priceSet = json['price_set'] != null
        ? PriceSet.fromJson(json['price_set'])
        : null;
    productExists = json['product_exists'];
    productId = json['product_id'];

    quantity = json['quantity'];
    requiresShipping = json['requires_shipping'];
    sku = json['sku'];
    taxable = json['taxable'];
    title = json['title'];
    totalDiscount = json['total_discount'];
    totalDiscountSet = json['total_discount_set'] != null
        ? PriceSet.fromJson(json['total_discount_set'])
        : null;
    variantId = json['variant_id'];
    variantInventoryManagement = json['variant_inventory_management'];
    variantTitle = json['variant_title'];
    vendor = json['vendor'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['admin_graphql_api_id'] = adminGraphqlApiId;
    data['fulfillable_quantity'] = fulfillableQuantity;
    data['fulfillment_service'] = fulfillmentService;
    data['fulfillment_status'] = fulfillmentStatus;
    data['gift_card'] = giftCard;
    data['grams'] = grams;
    data['name'] = name;
    data['price'] = price;
    if (priceSet != null) {
      data['price_set'] = priceSet!.toJson();
    }
    data['product_exists'] = productExists;
    data['product_id'] = productId;

    data['quantity'] = quantity;
    data['requires_shipping'] = requiresShipping;
    data['sku'] = sku;
    data['taxable'] = taxable;
    data['title'] = title;
    data['total_discount'] = totalDiscount;
    if (totalDiscountSet != null) {
      data['total_discount_set'] = totalDiscountSet!.toJson();
    }
    data['variant_id'] = variantId;
    data['variant_inventory_management'] = variantInventoryManagement;
    data['variant_title'] = variantTitle;
    data['vendor'] = vendor;

    return data;
  }
}