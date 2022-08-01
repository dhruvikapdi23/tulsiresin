import 'package:flutter/cupertino.dart';
import 'package:tulsiresin/config.dart';
import 'package:tulsiresin/models/product.dart';

class RecentViewListCard extends StatelessWidget {
   final Product data;
  final int? index;
  final GestureTapCallback? onTap;
  final GestureTapCallback? heartIconTap;

  const RecentViewListCard(
      {Key? key,required this.data, this.index, this.onTap, this.heartIconTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              data.image != null || data.images!.isNotEmpty ?
              Image.network(
                data.image != null ? data.image!.src.toString() : data.images![0].src.toString(),
                height: Sizes.s180,
                width: Sizes.s140,
                fit: BoxFit.cover,
              ):Container() ,
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
          Text(data.title.toString())
              .textColor(appCtrl.appTheme.black.withOpacity(.8))
              .fontSize(FontSizes.s14),
          Space(0, Sizes.s10),
          Row(
            children: [
              Text('\$ ${data.variants![0].price.toString()}')
                  .textColor(appCtrl.appTheme.black)
                  .fontSize(FontSizes.s14),
              Space(10, 0),
              /*Text('\$ ${data..toString()}')
                  .textColor(appCtrl.appTheme.grayPrimary)
                  .fontSize(FontSizes.s12)
                  .textDecoration(TextDecoration.lineThrough),*/
              Space(10, 0),
              const Icon(Icons.add_shopping_cart, size: Sizes.s18)
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
    );
  }
}
