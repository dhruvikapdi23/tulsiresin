class CategoryModel {
  String? id;
  String? handle;
  String? title;
  String? updatedAt;
  String? bodyHtml;
  String? publishedAt;
  String? sortOrder;
  String? templateSuffix;
  int? productsCount;
  String? collectionType;
  String? publishedScope;
  String? adminGraphqlApiId;

  CategoryModel({this.id, this.handle, this.title, this.updatedAt, this.bodyHtml, this.publishedAt, this.sortOrder, this.templateSuffix, this.productsCount, this.collectionType, this.publishedScope, this.adminGraphqlApiId});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    handle = json['handle'];
    title = json['title'];
    updatedAt = json['updated_at'];
    bodyHtml = json['body_html'];
    publishedAt = json['published_at'];
    sortOrder = json['sort_order'];
    templateSuffix = json['template_suffix'];
    productsCount = json['products_count'];
    collectionType = json['collection_type'];
    publishedScope = json['published_scope'];
    adminGraphqlApiId = json['admin_graphql_api_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['handle'] = handle;
    data['title'] = title;
    data['updated_at'] = updatedAt;
    data['body_html'] = bodyHtml;
    data['published_at'] = publishedAt;
    data['sort_order'] = sortOrder;
    data['template_suffix'] = templateSuffix;
    data['products_count'] = productsCount;
    data['collection_type'] = collectionType;
    data['published_scope'] = publishedScope;
    data['admin_graphql_api_id'] = adminGraphqlApiId;
    return data;
  }
}
