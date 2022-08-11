import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:tulsiresin/models/product.dart';

import '../../../config.dart';

class CartListCard extends StatelessWidget {
  final ProductModel? product;
  final GestureTapCallback? plusTap;
  final GestureTapCallback? minusTap;
  final String? quantity;
  final int? optionLength;

  const CartListCard(
      {Key? key, this.product, this.quantity, this.minusTap, this.plusTap,this.optionLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(product!.options!.length);
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(svgAssets.delete),
                Space(10, 0),
                CachedNetworkImage(
                  imageUrl: product!.image!.src.toString(),

                  imageBuilder: (context, imageProvider) => Image.network(
                    product!.image!.src.toString(),
                    height: Sizes.s100,
                    width: Sizes.s80,
                    fit: BoxFit.cover,
                  ),
                  placeholder: (context, url) =>
                   CircularProgressIndicator(strokeWidth: 1),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),

              ],
            ),
            Space(15, 0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product!.title.toString(),
                        overflow: TextOverflow.clip,
                      ).fontSize(FontSizes.s14).textColor(appCtrl.appTheme.txt),
                      Space(0, 5),
                      Text('\$${product!.variants![0].price.toString()}')
                          .fontSize(FontSizes.s14)
                          .textColor(appCtrl.appTheme.black)
                          .fontWeight(FontWeight.w700),
                      Space(0, 8),
                       (optionLength! > 1) ?
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [ ...product!.options!.asMap().entries.map((e) {
                           return Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text(
                                 e.value.name.toString(),
                                 overflow: TextOverflow.clip,
                               )
                                   .fontSize(FontSizes.s14)
                                   .textColor(appCtrl.appTheme.txt),
                               Text(e.value.values![0].toString())
                                   .fontSize(FontSizes.s14)
                                   .textColor(appCtrl.appTheme.txt),
                             ],
                           ).marginOnly(bottom: Insets.i8);
                         }).toList(),],
                       ):Container()
                    ],
                  ),
                  Container(
                    height: Sizes.s30,
                    width: Sizes.s120,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: Insets.i8),
                    decoration: BoxDecoration(
                        border: Border.all(color: appCtrl.appTheme.borderGray)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: minusTap,
                          child: const Icon(
                            CupertinoIcons.minus,
                            size: Insets.i18,
                          ),
                        ),
                        Text(quantity!),
                        InkWell(
                          onTap: plusTap,
                          child: const Icon(
                            Icons.add,
                            size: Insets.i18,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ).width(MediaQuery.of(context).size.width),
            )
          ],
        ).marginOnly(bottom: Insets.i10, top: Insets.i10),
        const Divider(
          indent: Insets.i100,
        )
      ],
    );
  }
}
