import 'package:graphql/client.dart';

import '../../utilities/general_utils.dart';
import '../common/constants.dart';
import '../models/category.dart';
import '../models/product.dart';
import 'shopify_query.dart';
import 'shopify_storage.dart';

class ShopifyService {
  ShopifyService() : super() {
    client = getClient();
  }

  late GraphQLClient client;

  String domain = "https://tulsiresin.myshopify.com";
  String accessToken = "dbcf47543d082f0196eafad5c6174239";
  ShopifyStorage shopifyStorage = ShopifyStorage();

  GraphQLClient getClient() {
    final httpLink = HttpLink('$domain/api/graphql');
    final authLink = AuthLink(
      headerKey: 'X-Shopify-Storefront-Access-Token',
      getToken: () async => accessToken,
    );
    return GraphQLClient(
      cache: GraphQLCache(),
      link: authLink.concat(httpLink),
    );
  }

  Future<List<Category>> getCategoriesByCursor({List<Category>? categories, String? cursor}) async {
    try {
      const nRepositories = 50;
      var variables = <String, dynamic>{'nRepositories': nRepositories};

      print(":::: getCategoriesByCursor cursor : $cursor");

      if (cursor != null) {
        variables['cursor'] = cursor;
      }
      final options = QueryOptions(
        document: gql(ShopifyQuery.readCollections),
        variables: variables,
      );
      final result = await client.query(options);

      if (result.hasException) {
        printLog(result.exception.toString());
      }

      var list = categories ?? <Category>[];

      for (var item in result.data!['shop']['collections']['edges']) {
        var category = item['node'];

        list.add(Category.fromJsonShopify(category));
      }
      if (result.data?['shop']?['collections']?['pageInfo']?['hasNextPage'] ?? false) {
        var lastCategory = result.data!['shop']['collections']['edges'].last;
        String? cursor = lastCategory['cursor'];
        if (cursor != null) {
          printLog('::::getCategories shopify by cursor $cursor');
          return await getCategoriesByCursor(categories: list, cursor: cursor);
        }
      }
      return list;
    } catch (e) {
      return categories ?? [];
    }
  }

  Future<List<Product>?> fetchProductsByCategory({
    categoryId,
    tagId,
    page = 1,
    minPrice,
    maxPrice,
    orderBy,
    lang,
    order,
    attribute,
    attributeTerm,
    featured,
    onSale,
    listingLocation,
    userId,
    nextCursor,
    String? include,
    String? search,
    limit,
  }) async {
    printLog('::::request fetchProductsByCategory with category id $categoryId search:$search');
    printLog('::::request fetchProductsByCategory with cursor ${shopifyStorage.cursor}');

    /// change category id
    if (page == 1) {
      shopifyStorage.cursor = '';
      shopifyStorage.hasNextPage = true;
    }

    printLog('fetchProductsByCategory with shopifyStorage ${shopifyStorage.toJson()}');

    try {
      var list = <Product>[];

      if (!shopifyStorage.hasNextPage!) {
        return list;
      }

      var currentCursor = shopifyStorage.cursor;

      print(":::: fetchProductsByCategory cursor : $currentCursor");

      const nRepositories = 50;
      final options = QueryOptions(
        document: gql(ShopifyQuery.getProductByCollection),
        fetchPolicy: FetchPolicy.networkOnly,
        variables: <String, dynamic>{
          'nRepositories': nRepositories,
          'categoryId': categoryId,
          'pageSize': limit ?? 20,
          'query': search ?? '',
//          'sortKey': sortKey,
          'cursor': currentCursor != '' ? currentCursor : null
        },
      );
      final result = await client.query(options);

      if (result.hasException) {
        printLog(result.exception.toString());
      }

      var node = result.data?['node'];

      // printLog('fetchProductsByCategory with new node $node');

      if (node != null) {
        var productResp = node['products'];
        var pageInfo = productResp['pageInfo'];
        var hasNextPage = pageInfo['hasNextPage'];
        var edges = productResp['edges'];

        printLog('fetchProductsByCategory with products length ${edges.length}');

        if (edges.length != 0) {
          var lastItem = edges.last;
          var cursor = lastItem['cursor'];

          printLog('fetchProductsByCategory with new cursor $cursor');

          // set next cursor
          shopifyStorage.setShopifyStorage(cursor, categoryId, hasNextPage);
        }

        for (var item in result.data!['node']['products']['edges']) {
          var product = item['node'];
          product['categoryId'] = categoryId;

          /// Hide out of stock.
          if ((hideOutOfStock) && product['availableForSale'] == false) {
            continue;
          }
          list.add(Product.fromShopify(product));
        }
      }

      return list;
    } catch (e) {
      printLog('::::fetchProductsByCategory shopify error $e');
      printLog(e.toString());
      rethrow;
    }
  }
}
