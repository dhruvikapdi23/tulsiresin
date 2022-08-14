import 'package:tulsiresin/routes/screen_list.dart';

import '../../../config.dart';
import '../../../models/product.dart';

class RecentSearchCard extends StatelessWidget {
  final ProductModel? recentSearchModel;

  const RecentSearchCard({Key? key, this.recentSearchModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(const ProductDetail(),
          arguments: recentSearchModel, preventDuplicates: false),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: appCtrl.appTheme.grey,
                              borderRadius: BorderRadius.circular(AppRadius.r50)),
                          height: Sizes.s55,
                          width: Sizes.s55,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(AppRadius.r50),
                            child: Image.network(
                              recentSearchModel!.images![0].src.toString(),
                              height: Sizes.s60,
                              alignment: Alignment.topCenter,
                              width: Sizes.s65,
                              fit: BoxFit.cover,
                            ),
                          )),
                      Space(15, 0),
                      Expanded(
                        child: Text(
                          recentSearchModel!.title!,
                          overflow: TextOverflow.clip,
                        ).fontSize(FontSizes.s14),
                      )
                    ],
                  ).marginSymmetric(vertical: Insets.i10),
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: Insets.i20,
                )
              ],
            ),
            Divider(
              color: appCtrl.appTheme.lightGray,
            )
          ],
        ).marginSymmetric(horizontal: Insets.i15),
      ),
    );
  }
}
