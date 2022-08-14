class Variants {
  int? productId;
  int? id;
  String? title;
  String? price;
  String? sku;
  int? position;
  String? inventoryPolicy;
  String? compareAtPrice;
  String? fulfillmentService;
  String? inventoryManagement;
  String? option1;
  String? option2;
  String? option3;
  String? createdAt;
  String? updatedAt;
  bool? taxable;
  bool? inStock;
  int? stockQuantity;
  String? barcode;
  int? grams;
  int? imageId;
  double? weight;
  String? weightUnit;
  int? inventoryItemId;
  int? inventoryQuantity;
  int? oldInventoryQuantity;
  bool? requiresShipping;
  String? adminGraphqlApiId;
  Node? node;

  Variants(
      {this.productId,
      this.id,
      this.title,
      this.price,
      this.sku,
      this.position,
      this.inStock,
      this.stockQuantity,
      this.inventoryPolicy,
      this.compareAtPrice,
      this.fulfillmentService,
      this.inventoryManagement,
      this.option1,
      this.option2,
      this.option3,
      this.createdAt,
      this.updatedAt,
      this.taxable,
      this.barcode,
      this.grams,
      this.imageId,
      this.weight,
      this.weightUnit,
      this.inventoryItemId,
      this.inventoryQuantity,
      this.oldInventoryQuantity,
      this.requiresShipping,
      this.adminGraphqlApiId,this.node});

  Variants.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    id = json['id'];
    title = json['title'];
    price = json['price'];
    sku = json['sku'];
    position = json['position'];
    inventoryPolicy = json['inventory_policy'];
    inStock = json['inStock'];
    stockQuantity = json['stockQuantity'];
    compareAtPrice = json['compare_at_price'];
    fulfillmentService = json['fulfillment_service'];
    inventoryManagement = json['inventory_management'];
    option1 = json['option1'];
    option2 = json['option2'];
    option3 = json['option3'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    taxable = json['taxable'];
    barcode = json['barcode'];
    grams = json['grams'];
    imageId = json['image_id'];
    weight = json['weight'];
    weightUnit = json['weight_unit'];
    inventoryItemId = json['inventory_item_id'];
    inventoryQuantity = json['inventory_quantity'];
    oldInventoryQuantity = json['old_inventory_quantity'];
    requiresShipping = json['requires_shipping'];
    adminGraphqlApiId = json['admin_graphql_api_id'];
    node = json.containsKey('node') ?json['node'] != null ?  Node.fromJson(json['node']) : null : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['sku'] = sku;
    data['position'] = position;
    data['inventory_policy'] = inventoryPolicy;
    data['compare_at_price'] = compareAtPrice;
    data['stockQuantity'] = stockQuantity;
    data['inStock'] = inStock;
    data['fulfillment_service'] = fulfillmentService;
    data['inventory_management'] = inventoryManagement;
    data['option1'] = option1;
    data['option2'] = option2;
    data['option3'] = option3;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['taxable'] = taxable;
    data['barcode'] = barcode;
    data['grams'] = grams;
    data['image_id'] = imageId;
    data['weight'] = weight;
    data['weight_unit'] = weightUnit;
    data['inventory_item_id'] = inventoryItemId;
    data['inventory_quantity'] = inventoryQuantity;
    data['old_inventory_quantity'] = oldInventoryQuantity;
    data['requires_shipping'] = requiresShipping;
    data['admin_graphql_api_id'] = adminGraphqlApiId;
    if (node != null) {
      data['node'] = node!.toJson();
    }
    return data;
  }
}

class PriceV2 {
  String? sTypename;
  String? amount;
  String? currencyCode;

  PriceV2({this.sTypename, this.amount, this.currencyCode});

  PriceV2.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    amount = json['amount'];
    currencyCode = json['currencyCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['__typename'] = sTypename;
    data['amount'] = amount;
    data['currencyCode'] = currencyCode;
    return data;
  }
}
class PriceModel {
  String? sTypename;
  Node? node;

  PriceModel({this.sTypename, this.node});

  PriceModel.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    node = json['node'] != null ? Node.fromJson(json['node']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['__typename'] = sTypename;
    if (node != null) {
      data['node'] = node!.toJson();
    }
    return data;
  }
}

class Node {
  String? sTypename;
  String? id;
  String? title;
  bool? availableForSale;
  int? quantityAvailable;
  List<SelectedOptions>? selectedOptions;
  Image? image;
  PriceV2? priceV2;
  Null? compareAtPriceV2;

  Node(
      {this.sTypename,
        this.id,
        this.title,
        this.availableForSale,
        this.quantityAvailable,
        this.selectedOptions,
        this.image,
        this.priceV2,
        this.compareAtPriceV2});

  Node.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    id = json['id'];
    title = json['title'];
    availableForSale = json['availableForSale'];
    quantityAvailable = json['quantityAvailable'];
    if (json['selectedOptions'] != null) {
      selectedOptions = <SelectedOptions>[];
      json['selectedOptions'].forEach((v) {
        selectedOptions!.add(SelectedOptions.fromJson(v));
      });
    }
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    priceV2 =
    json['priceV2'] != null ? PriceV2.fromJson(json['priceV2']) : null;
    compareAtPriceV2 = json['compareAtPriceV2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['__typename'] = sTypename;
    data['id'] = id;
    data['title'] = title;
    data['availableForSale'] = availableForSale;
    data['quantityAvailable'] = quantityAvailable;
    if (selectedOptions != null) {
      data['selectedOptions'] =
          selectedOptions!.map((v) => v.toJson()).toList();
    }
    if (image != null) {
      data['image'] = image!.toJson();
    }
    if (priceV2 != null) {
      data['priceV2'] = priceV2!.toJson();
    }
    data['compareAtPriceV2'] = compareAtPriceV2;
    return data;
  }
}

class SelectedOptions {
  String? sTypename;
  String? name;
  String? value;

  SelectedOptions({this.sTypename, this.name, this.value});

  SelectedOptions.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['__typename'] = sTypename;
    data['name'] = name;
    data['value'] = value;
    return data;
  }
}

class Image {
  String? sTypename;
  String? src;

  Image({this.sTypename, this.src});

  Image.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    src = json['src'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['__typename'] = sTypename;
    data['src'] = src;
    return data;
  }
}
