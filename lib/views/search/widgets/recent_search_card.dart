import '../../../config.dart';

class RecentSearchCard extends StatelessWidget {
  final RecentSearchModel? recentSearchModel;
  const RecentSearchCard({Key? key,this.recentSearchModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Get.toNamed(routeName.productDetail),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: appCtrl.appTheme.grey,
                            borderRadius:
                            BorderRadius.circular(AppRadius.r50)),
                        height: Sizes.s55,
                        width: Sizes.s55,
                        child: recentSearchModel!.image!.contains('svg')
                            ? SvgPicture.asset(
                          recentSearchModel!.image!,
                          fit: BoxFit.contain,
                          height: Sizes.s25,
                        ).paddingSymmetric(horizontal: Insets.i15)
                            : ClipRRect(
                          borderRadius:
                          BorderRadius.circular(AppRadius.r50),
                          child: Image.asset(
                            recentSearchModel!.image!,
                            height: Sizes.s60,
                            alignment: Alignment.topCenter,
                            width: Sizes.s65,
                            fit: BoxFit.cover,
                          ),
                        )),
                    Space(15, 0),
                    Text(recentSearchModel!.title!).fontSize(FontSizes.s16)
                  ],
                ).marginSymmetric(vertical: Insets.i10),
                const Icon(Icons.arrow_forward_ios_rounded,size: Insets.i20,)
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
