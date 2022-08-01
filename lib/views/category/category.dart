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
          automaticallyImplyLeading: false,
          title: CustomTextFormField(
            radius: AppRadius.r50,
            controller: categoryCtrl.txtSearch,
            fillColor: appCtrl.appTheme.grey,
            hintText: CommonFonts().searchForItem,
            onChanged: (val) => categoryCtrl.searchList(val),
            prefixIcon: SvgPicture.asset(svgAssets.search),
            inputBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: categoryCtrl.categoryListData.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap:()=> Get.toNamed(routeName.product) ,
              child: Container(
                color: appCtrl.appTheme.lightGray,
                margin: const EdgeInsets.only(bottom: Insets.i15),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(categoryCtrl.categoryListData[index]["name"]).marginOnly(left: Insets.i20),
                    Image.asset(categoryCtrl.categoryListData[index]["image"],height: Sizes.s150,)
                  ],
                ).gestures(onTap: ()=> Get.toNamed(routeName.product)).marginSymmetric(horizontal: Insets.i15),
              ),
            );
          },
        ).marginSymmetric(horizontal: Insets.i15,vertical: Insets.i15),
      );
    });
  }
}
