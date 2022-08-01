import 'package:flutter/cupertino.dart';

import '../../../config.dart';

class RecentSearchProduct extends StatelessWidget {
  final ProductViewModel? productViewModel;
final GestureTapCallback? onTap;
  const RecentSearchProduct({Key? key, this.productViewModel,this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(routeName.productDetail),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Image.asset(
                productViewModel!.image.toString(),
                height: Sizes.s180,
                width: MediaQuery.of(context).size.width / 2.2,
                fit: BoxFit.cover,
              ),
              productViewModel!.isFav!
                  ? Icon(
                      CupertinoIcons.heart_fill,
                      color: appCtrl.appTheme.red,
                    ).gestures(onTap: onTap).marginOnly(top: Insets.i10, right: Insets.i15)
                  : const Icon(CupertinoIcons.heart).gestures(onTap: onTap)
                      .marginOnly(top: Insets.i10, right: Insets.i15)
            ],
          ),
          Space(0, Sizes.s8),
          Text(productViewModel!.name.toString())
              .textColor(appCtrl.appTheme.black.withOpacity(.8))
              .fontSize(FontSizes.s14),
          Space(0, Sizes.s10),
          Row(
            children: [
              Text('\$ ${productViewModel!.price.toString()}')
                  .textColor(appCtrl.appTheme.black)
                  .fontSize(FontSizes.s14),
              Space(10, 0),
              Text('\$ ${productViewModel!.discountPrice.toString()}')
                  .textColor(appCtrl.appTheme.grayPrimary)
                  .fontSize(FontSizes.s12)
                  .textDecoration(TextDecoration.lineThrough),
              Space(10, 0),
              const Icon(Icons.add_shopping_cart, size: Sizes.s18)
            ],
          ),
          Space(0, Sizes.s10),
          Text(productViewModel!.isInStock == true
                  ? 'In stock'
                  : "Out  of stock")
              .textColor(productViewModel!.isInStock == true
                  ? appCtrl.appTheme.primary
                  : appCtrl.appTheme.red)
              .fontSize(FontSizes.s12),
        ],
      ),
    );
  }
}
