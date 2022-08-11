import 'package:tulsiresin/common/array/category.dart';
import 'package:tulsiresin/config.dart';
import 'package:tulsiresin/controllers/category_controller.dart';
import 'package:tulsiresin/widgets/common/custom_text_form_field.dart';

class Category extends StatelessWidget {
  final categoryCtrl = Get.put(CategoryController());

  Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(builder: (_) {
      return Scaffold(
        backgroundColor: appCtrl.appTheme.surface,
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: appCtrl.appTheme.surface,
          elevation: 0,

          title:const Text('Category'),
        ),
        body: ListView.builder(
          itemCount: getCategories.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap:()=> Get.toNamed(routeName.product) ,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(getCategories[index].title!).marginOnly(left: Insets.i20),
                      const Icon(Icons.arrow_forward_ios_rounded)
                    ],
                  ),
                  Divider(color: appCtrl.appTheme.borderGray,height: 40,)
                ],
              ),
            );
          },
        ).marginSymmetric(horizontal: Insets.i15,vertical: Insets.i15),
      );
    });
  }
}
