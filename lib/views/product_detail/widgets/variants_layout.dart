import 'package:tulsiresin/config.dart';
import 'package:tulsiresin/controllers/product_detail_controller.dart';
import 'package:tulsiresin/views/product_detail/widgets/variants_list.dart';

class VariantsLayout extends StatelessWidget {
  final List<Options>? options;
  final String? optionValue;
  final int? optionLength;
  const VariantsLayout({Key? key, this.options,this.optionValue,this.optionLength}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(
      builder: (productCtrl) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...options!.asMap().entries.map((e) {
              return Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: Insets.i15, vertical: Insets.i10),
                padding: const EdgeInsets.symmetric(
                    horizontal: Insets.i15, vertical: Insets.i15),
                decoration: BoxDecoration(
                  border: Border.all(color: appCtrl.appTheme.lightGray),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(e.value.name.toString()).fontWeight(FontWeight.w600),
                    Row(
                      children: [
                        Text(optionValue!),
                        if (e.value.values!.length > 1)
                        const Icon(Icons.keyboard_arrow_down_rounded)
                      ],
                    )
                  ],
                ),
              ).gestures(onTap: () {

                if (e.value.values!.length > 1)
                  Get.bottomSheet(
                    VariantsList(
                      options: e.value,
                    ),
                    backgroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
              });
            }).toList()
          ],
        );
      }
    );
  }
}
