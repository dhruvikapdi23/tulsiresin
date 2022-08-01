import 'package:tulsiresin/controllers/product_detail_controller.dart';

import '../../../config.dart';

class VariantsList extends StatelessWidget {
  final dynamic options;
  const VariantsList({Key? key,this.options}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(
      builder: (productCtrl) {
        return SizedBox(
          height: Sizes.s260,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ...options.values!.asMap().entries.map((e) {
                      return Text(e.value)
                          .marginSymmetric(vertical: Insets.i12).gestures(
                        onTap: (){
                          productCtrl.optionValue = e.value;
                          for(var i=0;i<productCtrl.product!.variants!.length;i++){
                            if(productCtrl.product!.variants![i].title == e.value){
                              productCtrl.variantIndex = i;
                              productCtrl.update();
                            }
                          }
                          productCtrl.update();
                          Get.back();
                        }
                      );
                    }).toList(),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Divider(
                    color: appCtrl.appTheme.lightGray,
                  ),
                  const Text("Select the Size")
                      .fontSize(FontSizes.s16)
                ],
              ).marginOnly(bottom: Insets.i15),
            ],
          ),
        );
      }
    );
  }
}
