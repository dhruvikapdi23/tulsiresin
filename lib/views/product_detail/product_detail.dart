import 'dart:math';

import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:tulsiresin/config.dart';
import 'package:tulsiresin/controllers/dashboard_controller.dart';
import 'package:tulsiresin/controllers/product_detail_controller.dart';
import 'package:tulsiresin/views/product_detail/widgets/common_detail.dart';
import 'package:tulsiresin/views/product_detail/widgets/image_slider.dart';
import 'package:tulsiresin/views/product_detail/widgets/product_name_price.dart';
import 'package:tulsiresin/views/product_detail/widgets/variants_layout.dart';
import 'package:tulsiresin/views/product_detail/widgets/you_may_also_like.dart';
import 'package:tulsiresin/widgets/common/custom_button.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final productCtrl = Get.put(ProductDetailController());
  ScrollController? _scrollController;
  bool lastStatus = true;

  void _scrollListener() {
    if (_isShrink != lastStatus) {
      setState(() {
        lastStatus = _isShrink;
      });
    }
  }

  bool get _isShrink {
    return _scrollController!.hasClients &&
        _scrollController!.offset > (Sizes.s380 - kToolbarHeight);
  }

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController!.removeListener(_scrollListener);
    _scrollController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: (_) {
      return Scaffold(
        body: NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                    expandedHeight: Sizes.s400,
                    backgroundColor: appCtrl.appTheme.white,
                    floating: false,
                    leading: _isShrink
                        ? const Icon(Icons.arrow_back)
                            .gestures(onTap: () => Get.back())
                        : Container(),
                    pinned: true,
                    automaticallyImplyLeading: false,
                    flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true, background: ImageSlider()))
              ];
            },
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ImageSlider(),
                  Space(0, 20),
                  if (productCtrl.product != null)
                    ProductNamePrice(
                      product: productCtrl.product,
                      variantIndex: productCtrl.variantIndex,
                    ),
                  if (productCtrl.product != null && productCtrl.product!.variants!.length >1)
                    VariantsLayout(
                        options: productCtrl.product!.options,
                        optionValue: productCtrl.optionValue),
                  if (productCtrl.product != null && productCtrl.product!.variants!.length >1)
                  Space(0, 20),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          CommonFonts().quantity,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      Container(
                        height: 32,
                        width: 32,
                        margin: const EdgeInsets.only(right: Insets.i10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(3.0),
                          border: Border.all(
                            color: appCtrl.appTheme.grey,
                          ),
                        ),
                        child: IconButton(
                          padding: EdgeInsets.all(
                            max(
                              ((32) - 24.0 - 8) * 0.5,
                              0.0,
                            ),
                          ),
                          onPressed: () {
                            int qunatity =
                                int.parse(productCtrl.txtQuantity.text);
                            if (qunatity == 1) {
                              qunatity = 1;
                            } else {
                              qunatity--;
                            }
                            productCtrl.update();
                            productCtrl.txtQuantity.text = qunatity.toString();
                          },
                          icon: const Icon(
                            Icons.remove,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        height: 32.0,
                        width: Sizes.s150,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: TextFormField(
                          maxLines: 1,
                          controller: productCtrl.txtQuantity,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: appCtrl.appTheme.lightGray,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: appCtrl.appTheme.lightGray,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: appCtrl.appTheme.lightGray,
                              ),
                            ),
                            counterText: '',
                          ),
                          keyboardType: const TextInputType.numberWithOptions(
                            signed: true,
                            decimal: false,
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: Insets.i10),
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(3.0),
                          border: Border.all(
                            color: appCtrl.appTheme.grey,
                          ),
                        ),
                        child: IconButton(
                          padding: EdgeInsets.all(
                            max(
                              ((32) - 24.0 - 8) * 0.5,
                              0.0,
                            ),
                          ),
                          onPressed: () {
                            int qunatity =
                                int.parse(productCtrl.txtQuantity.text);
                            qunatity++;
                            productCtrl.update();
                            productCtrl.txtQuantity.text = qunatity.toString();
                          },
                          icon: const Icon(
                            Icons.add,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ).marginSymmetric(horizontal: Insets.i15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomButton(
                          title: CommonFonts().buyNow,
                          color: appCtrl.appTheme.primary,
                          width: MediaQuery.of(context).size.width / 1.4,
                          radius: 0,
                          padding: const EdgeInsets.all(Insets.i15),
                          onTap: () => Get.toNamed(routeName.checkOut),
                        ),
                      ),
                      Space(15, 0),
                      GetBuilder<DashboardController>(builder: (ctrl) {
                        return Expanded(
                          child: CustomButton(
                            title: CommonFonts().addToCart,
                            color: appCtrl.appTheme.gray6,
                            fontColor: appCtrl.appTheme.black,
                            width: MediaQuery.of(context).size.width / 1.4,
                            radius: 0,
                            onTap: () {
                              Get.toNamed(routeName.checkOut);
                            },
                            padding: const EdgeInsets.all(Insets.i15),
                          ),
                        );
                      }),
                    ],
                  ).marginSymmetric(
                      horizontal: Insets.i15, vertical: Insets.i20),
                  if (productCtrl.product != null)
                    Theme(
                      data: ThemeData.light()
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        controlAffinity: ListTileControlAffinity.trailing,
                        childrenPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        expandedCrossAxisAlignment: CrossAxisAlignment.end,
                        collapsedIconColor: appCtrl.appTheme.black,
                        iconColor: appCtrl.appTheme.black,
                        maintainState: true,
                        title: Text(CommonFonts().description)
                            .textColor(appCtrl.appTheme.black),
                        // contents
                        children: [
                          HtmlWidget( productCtrl.product!.description ?? "",),

                         /* Text(productCtrl.product!.bodyHtml ?? "")
                              .overFlow(TextOverflow.clip)
                              .letterSpacing(.5),*/
                          // This button is used to remove this item
                        ],
                      ),
                    ),
                  /*if (productCtrl.product != null)
                    CommonDetail(
                      title: CommonFonts().productCode,
                      value: productCtrl
                          .product!.variants![productCtrl.variantIndex].sku!,
                    ),*/
                  /*if (productCtrl.product != null)
                    CommonDetail(
                      title: CommonFonts().category,
                      value: productCtrl.product!.productType!,
                    ),*/
                /*  if (productCtrl.product != null)
                    CommonDetail(
                      title: CommonFonts().material,
                      value: productCtrl.product!.handle!,
                    ),*/
                  Space(0, 20),

                  if (productCtrl.product != null) const YouMayAlsoLike()
                ],
              ).marginOnly(bottom: Insets.i50),
            )),
      );
    });
  }
}
