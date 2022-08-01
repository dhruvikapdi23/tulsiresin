import 'package:carousel_slider/carousel_slider.dart';

import '../../../config.dart';

class BannerList extends StatelessWidget {
  const BannerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2,
        viewportFraction: 1,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
      ),
      itemCount: bannerList.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        return InkWell(
          onTap: ()=> Get.toNamed(routeName.productDetail),
          child: Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.only(top: Insets.i20),
                width: MediaQuery.of(context).size.width,
                color: const Color(0xFFF6F6F7),
                child: Image.asset(
                  bannerList[itemIndex].image.toString(),
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text("|").textColor(appCtrl.appTheme.secondaryGray),
                      Space(5, 0),
                      Text(bannerList[itemIndex].title.toString())
                          .textColor(appCtrl.appTheme.secondaryGray),
                    ],
                  ),
                  Space(0, 25),
                  Text(bannerList[itemIndex].description.toString())
                      .textColor(appCtrl.appTheme.black)
                      .fontSize(FontSizes.s25),
                ],
              ).paddingOnly(left: Insets.i30, top: Insets.i40)
            ],
          ),
        );
      },
    );
  }
}
