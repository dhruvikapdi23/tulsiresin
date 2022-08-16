import 'package:tulsiresin/controllers/home_controller.dart';
import 'package:tulsiresin/models/product.dart';
import 'package:tulsiresin/views/home/widgets/common_title.dart';
import 'package:tulsiresin/views/home/widgets/recent_view_list.dart';

import '../../../config.dart';

class CollectionProducts extends StatefulWidget {
  final dynamic collection;

  const CollectionProducts({super.key, required this.collection});

  @override
  State<CollectionProducts> createState() => _CollectionProductsState();
}

class _CollectionProductsState extends State<CollectionProducts> {
  final homeCtrl = Get.isRegistered<HomeController>() ? Get.find<HomeController>() : Get.put(HomeController());
  late Future productFuture;

  @override
  void initState() {
    // TODO: implement initState
    productFuture = homeCtrl.getProductDataByCollectionId(widget.collection['category']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTitle(title: widget.collection['name'] ?? '', category: widget.collection ?? ''),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: FutureBuilder(
            future: productFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // If we got an error
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      '${snapshot.error} occurred',
                      style: const TextStyle(fontSize: 18),
                    ),
                  );

                  // if we got our data
                } else if (snapshot.hasData) {
                  // Extracting data from snapshot object
                  final data = snapshot.data as List<ProductModel>;
                  //print('data : $data');
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...data.asMap().entries.map((e) {
                          return RecentViewListCard(
                            data: e.value,
                            index: e.key,
                            onTap: () => Get.toNamed(routeName.productDetail, arguments: e.value),
                            heartIconTap: () {},
                          );
                        }).toList(),
                      ],
                    ),
                  );
                }
              }
              return const CircularProgressIndicator();
            },
          ).marginOnly(left: Insets.i20),
        ),
      ],
    );
  }
}
