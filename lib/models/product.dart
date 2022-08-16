import 'package:tulsiresin/models/index.dart';
import 'package:tulsiresin/models/variants.dart';

import '../config.dart';

class ProductModel {
  String? id;
  int? quantity;
  String? title;
  String? description;
  String? vendor;
  String? productType;
  String? createdAt;
  String? handle;
  String? updatedAt;
  String? publishedAt;
  String? templateSuffix;
  String? status;
  String? publishedScope;
  String? tags;
  String? adminGraphqlApiId;
  List<Variants>? variants;
  List<Options>? options;
  List<Images>? images;
  Images? image;
  //Extra
  String? categoryId;
  int? stockQuantity;
  String? price;
  String? regularPrice;
  String? salePrice;
  bool? onSale;
  bool? inStock;

  ProductModel({
    this.id,
    this.title,
    this.quantity,
    this.description,
    this.vendor,
    this.productType,
    this.createdAt,
    this.handle,
    this.updatedAt,
    this.publishedAt,
    this.templateSuffix,
    this.status,
    this.publishedScope,
    this.tags,
    this.adminGraphqlApiId,
    this.variants,
    this.options,
    this.images,
    this.image,
    //Extra
    this.categoryId,
    this.stockQuantity,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.onSale,
    this.inStock,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    var priceV2 = json['variants']['edges'][0]['node']['priceV2'];
    var compareAtPriceV2 = json['variants']['edges'][0]['node']['compareAtPriceV2'];
    var compareAtPrice = compareAtPriceV2 != null ? compareAtPriceV2['amount'] : null;
    var categories = json['collections'] != null ? json['collections']['edges'] : null;
    var defaultCategory = (categories?.isNotEmpty ?? false) ? categories[0]['node'] : null;

    id = json['id'];
    title = json['title'];
    quantity = json['quantity'];
    description = json['description'];
    vendor = json['vendor'];
    productType = json['product_type'];
    createdAt = json['created_at'];
    handle = json['handle'];
    updatedAt = json['updated_at'];
    publishedAt = json['published_at'];
    templateSuffix = json['template_suffix'];
    status = json['status'];
    publishedScope = json['published_scope'];
    tags = json['tags'];
    adminGraphqlApiId = json['admin_graphql_api_id'];

    //Extra Start
    categoryId = json['categoryId'] ?? (defaultCategory ?? {})['id'];
    stockQuantity = json['totalInventory'];
    price = priceV2 != null ? priceV2['amount'] : null;
    regularPrice = compareAtPrice ?? price;
    salePrice = price;
    onSale = compareAtPrice != null && compareAtPrice != price;
    inStock = json['availableForSale'];
    if ((stockQuantity ?? 0) <= 0) {
      inStock = false;
      stockQuantity = 0;
    }
    //Extra End

    if (json['variants']['edges'] != null) {
      variants = <Variants>[];
      json['variants']['edges'].forEach((v) {
        variants!.add(Variants.fromJson(v['node']));
      });
    } else {}
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(Options.fromJson(v));
      });
    }
    if (json['images']['edges'] != null) {
      images = <Images>[];
      json['images']['edges'].forEach((v) {
        images!.add(Images.fromJson(v['node']));
      });
    }
    image = json['image'] != null ? Images.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['quantity'] = quantity;
    data['title'] = title;
    data['description'] = description;
    data['vendor'] = vendor;
    data['product_type'] = productType;
    data['created_at'] = createdAt;
    data['handle'] = handle;
    data['updated_at'] = updatedAt;
    data['published_at'] = publishedAt;
    data['template_suffix'] = templateSuffix;
    data['status'] = status;
    data['published_scope'] = publishedScope;
    data['tags'] = tags;
    data['admin_graphql_api_id'] = adminGraphqlApiId;
    if (variants != null) {
      data['variants'] = variants!.map((v) => v.toJson()).toList();
    }
    if (options != null) {
      data['options'] = options!.map((v) => v.toJson()).toList();
    }
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    if (image != null) {
      data['image'] = image!.toJson();
    }
    return data;
  }
}
