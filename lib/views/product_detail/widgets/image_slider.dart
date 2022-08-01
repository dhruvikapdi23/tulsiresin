import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:tulsiresin/controllers/product_detail_controller.dart';

import '../../../config.dart';

class ImageSlider extends StatelessWidget {
  final CarouselController _controller = CarouselController();

  ImageSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: (productCtrl) {
      return Stack(
        alignment: Alignment.bottomCenter,
        children: [
         (productCtrl.product != null) ?
            CarouselSlider.builder(
              carouselController: _controller,
              options: CarouselOptions(
                  aspectRatio: 0.8,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: false,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    productCtrl.currentPage = index;
                    productCtrl.update();
                  }),
              itemBuilder: (ctx, index, realIdx) {
                return Image.network(
                  productCtrl.product!.images![index].src.toString(),
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ).gestures(onTap:()=>  productCtrl.handleImageTap(context, index: index, fullScreen: true),);
              },
              itemCount: productCtrl.product!.images!.length,
            ) : Container(),
          Positioned(
              top: 40,
              left: 10.0,
              child: InkWell(
                onTap: () => Get.back(),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: appCtrl.appTheme.black
                  ),
                  child:  Icon(CupertinoIcons.multiply,color: appCtrl.appTheme.white,size: Sizes.s24,)
                      .gestures(onTap: () => Get.back()),
                ),
              )),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  height: Sizes.s60,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
          if(productCtrl.product != null)
          Container(
            height: 55,
            margin: const EdgeInsets.only(bottom: Insets.i5),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 0; i < productCtrl.product!.images!.length; i++)
                    AnimatedContainer(
                      width: Sizes.s80,
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.all(4),
                      margin: const EdgeInsets.only(right: 10, top: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: appCtrl.appTheme.surface,
                        border: Border.all(
                          color: productCtrl.currentPage == i
                              ? Theme.of(context).colorScheme.primary
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Image.network(
                        productCtrl.product!.images![i].src.toString(),
                        fit: BoxFit.contain,
                      ),
                    ).gestures(onTap: () {
                      productCtrl.currentPage = i;
                      _controller.animateToPage(i);
                      productCtrl.update();
                    }),
                ],
              ),
            ),
          )
        ],
      );
    });
  }
}
