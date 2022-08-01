import 'package:flutter/cupertino.dart';
import 'package:tulsiresin/models/product.dart';

import '../../../config.dart';

class CartListCard extends StatelessWidget {
  final Product? product;
  final GestureTapCallback? plusTap;
  final GestureTapCallback? minusTap;
  final String? quantity;
  const CartListCard({Key? key,this.product,this.quantity,this.minusTap,this.plusTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(svgAssets.delete),
                Space(10, 0),
                Image.network(
                  product!.image!.src.toString(),
                  height: Sizes.s100,
                  width: Sizes.s80,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Space(15, 0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product!.title.toString(),overflow: TextOverflow.clip,)
                        .fontSize(FontSizes.s14)
                        .textColor(appCtrl.appTheme.txt),
                    Space(0, 5),
                    Text('\$${product!.variants![0].price.toString()}')
                        .fontSize(FontSizes.s14)
                        .textColor(appCtrl.appTheme.black)
                        .fontWeight(FontWeight.w700),
                    Space(0, 8),
                    ...product!.options!.asMap().entries.map((e) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(e.value.name.toString())
                                .fontSize(FontSizes.s14)
                                .textColor(appCtrl.appTheme.txt),
                            Text(e.value.values![0].toString())
                                .fontSize(FontSizes.s14)
                                .textColor(appCtrl.appTheme.txt),
                          ],
                        ).marginOnly(bottom: Insets.i8),
                      );
                    }).toList(),
                  ],
                ),
                Container(
                  height: Sizes.s30,
                  padding: EdgeInsets.symmetric(horizontal: Insets.i8),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: appCtrl.appTheme.borderGray)),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: minusTap,
                        child: const Icon(
                          CupertinoIcons.minus,
                          size: Insets.i18,
                        ),
                      ),
                      Space(15, 0),
                       Text(quantity!),
                      Space(15, 0),
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
