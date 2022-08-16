import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tulsiresin/models/product.dart';

import '../../../config.dart';

class ProductNamePrice extends StatelessWidget {
  final ProductModel? product;
  final int? variantIndex;
  const ProductNamePrice({Key? key, this.product, this.variantIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(product!.title ?? "").fontSize(FontSizes.s16).textColor(appCtrl.appTheme.txt),
        Space(0, 10),
        Row(
          children: [
            Text(
              "\$${product!.price ?? ''}",
            ).fontSize(FontSizes.s18).fontWeight(FontWeight.w600).textColor(appCtrl.appTheme.txt),
          ],
        ),
        Space(0, 10),
        Row(
          children: [
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: Sizes.s20,
              itemPadding: EdgeInsets.zero,
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: appCtrl.appTheme.primary,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            Space(10, 0),
            const Text("(8)").fontSize(FontSizes.s16)
          ],
        ),
      ],
    ).marginSymmetric(horizontal: Insets.i15, vertical: Insets.i20);
  }
}
