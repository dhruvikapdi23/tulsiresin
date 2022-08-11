import 'package:flutter/foundation.dart';
import 'package:tulsiresin/common/array/category.dart';
import 'package:tulsiresin/config.dart';
import 'package:tulsiresin/controllers/category_controller.dart';
import 'package:tulsiresin/models/category_model.dart';
import 'package:tulsiresin/widgets/common/custom_text_form_field.dart';
import 'package:tulsiresin/widgets/infinite_widgets/index.dart';

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
          title: const Text('Category'),
        ),
        body: RefreshIndicator(
          onRefresh: categoryCtrl.refreshData,
          child: PagedListView(
            pagingController: categoryCtrl.pagingController,
            addAutomaticKeepAlives: true,
            padding: const EdgeInsets.all(0),
            builderDelegate: PagedChildBuilderDelegate<dynamic>(
              itemBuilder: (context, item, index) => Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(item.title ?? '').marginOnly(left: Insets.i20),
                      const Icon(Icons.arrow_forward_ios_rounded),
                    ],
                  ),
                  Divider(
                    color: appCtrl.appTheme.borderGray,
                    height: 40,
                  )
                ],
              ).inkwell(
                onTap: () => Get.toNamed(
                  routeName.product,
                  arguments: {'categoryId': item.id},
                ),
              ),
              noItemsFoundIndicatorBuilder: (_) => NoDataWidget(),
              firstPageErrorIndicatorBuilder: (_) => FirstPageErrorWidget(pagingController: categoryCtrl.pagingController),
              newPageErrorIndicatorBuilder: (_) => NextPageErrorWidget(pagingController: categoryCtrl.pagingController),
            ),
          ),
        ),
        /*body: ListView.builder(
          itemCount: getCategories.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => Get.toNamed(routeName.product, arguments: {'categoryId': '1'}),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(getCategories[index].title!).marginOnly(left: Insets.i20),
                      const Icon(Icons.arrow_forward_ios_rounded),
                    ],
                  ),
                  Divider(
                    color: appCtrl.appTheme.borderGray,
                    height: 40,
                  )
                ],
              ),
            );
          },
        ).marginSymmetric(horizontal: Insets.i15, vertical: Insets.i15),*/
      );
    });
  }
}
