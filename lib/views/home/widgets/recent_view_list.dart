import 'package:cached_network_image/cached_network_image.dart';
import 'package:tulsiresin/config.dart';
import 'package:tulsiresin/controllers/cart_controller.dart';
import 'package:tulsiresin/models/product.dart';
import 'package:tulsiresin/routes/screen_list.dart';

class RecentViewListCard extends StatelessWidget {
  final cartCtrl = Get.isRegistered<CartController>() ? Get.find<CartController>() : Get.put(CartController());

  final ProductModel? data;
  final int? index;
  final GestureTapCallback? onTap;
  final GestureTapCallback? heartIconTap;

  RecentViewListCard({Key? key, required this.data, this.index, this.onTap, this.heartIconTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print('var : ${data!.variants![0].node!}');
    return InkWell(
      onTap: () => Get.to(const ProductDetail(), arguments: data, preventDuplicates: false),
      child: SizedBox(
        width: Sizes.s140,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                data!.image != null || data!.images!.isNotEmpty
                    ? CachedNetworkImage(
                        imageUrl: data!.image != null ? data!.image!.src.toString() : data!.images![0].src.toString(),
                        imageBuilder: (context, imageProvider) => Image.network(
                          data!.image != null ? data!.image!.src.toString() : data!.images![0].src.toString(),
                          height: Sizes.s140,
                          width: Sizes.s140,
                          fit: BoxFit.cover,
                        ),
                        placeholder: (context, url) => CircularProgressIndicator(strokeWidth: 1),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      )
                    : Container(),
                /*data.isFav ?? false
                    ? Icon(CupertinoIcons.heart_fill,color: appCtrl.appTheme.red,)
                        .marginOnly(top: Insets.i10, right: Insets.i15)
                        .gestures(onTap: heartIconTap)
                    : const Icon(CupertinoIcons.heart)
                        .marginOnly(top: Insets.i10, right: Insets.i15)
                        .gestures(onTap: heartIconTap)*/
              ],
            ),
            Space(0, Sizes.s8),
            Text(
              data!.title.toString(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ).textColor(appCtrl.appTheme.black.withOpacity(.8)).fontSize(FontSizes.s14).width(Sizes.s140),
            Space(0, Sizes.s10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$ ${data!.price}',
                ).textColor(appCtrl.appTheme.black).fontSize(FontSizes.s14),
                //Space(10, 0),
                const Icon(Icons.add_shopping_cart, size: Sizes.s18).inkwell(onTap: () {
                  var msg = cartCtrl.addProductToCart(
                    context: context,
                    product: data,
                    quantity: 1,
                    variation: data?.variants?[0],
                  );

                  if (msg.isNotEmpty) {
                    snackBar(msg);
                    printLog("::: error : $msg");
                  } else {
                    snackBar("${data?.title} have been added to your cart", type: "success");
                    printLog("::: ${data?.title} have been added to your cart");
                  }
                })
              ],
            ),
            Space(0, Sizes.s10),
            /* Text(data.isInStock == true ? 'In stock' : "Out  of stock")
                .textColor(data.isInStock == true
                    ? appCtrl.appTheme.primary
                    : appCtrl.appTheme.red)
                .fontSize(FontSizes.s12),*/
          ],
        ).marginOnly(
          right: Insets.i20,
        ),
      ),
    );
  }
}
