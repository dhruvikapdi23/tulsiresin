import 'package:tulsiresin/common/array/product.dart';
import 'package:tulsiresin/config.dart';
import 'package:tulsiresin/controllers/wishlist_controller.dart';
import 'package:tulsiresin/views/cart/widgets/cart_list_card.dart';
import 'package:tulsiresin/widgets/common/custom_button.dart';

class WishList extends StatelessWidget {
  final wishListCtrl = Get.put(WishlistController());
   WishList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WishlistController>(
      builder: (_) {

        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            centerTitle: true,
            leading:
                const Icon(Icons.arrow_back_ios).gestures(onTap: () => Get.back()),
            backgroundColor: appCtrl.appTheme.gray6,
            title: const Text("WishList"),
          ),
          body: SingleChildScrollView(
            //productList.isNotEmpty
            child: getProducts.isNotEmpty
                ? Column(
                    children: [
                      const Text('2 Items')
                          .fontSize(FontSizes.s14)
                          .textColor(appCtrl.appTheme.grayPrimary),
                      const Divider(),
                      ...getProducts.asMap().entries.map((e) {
                        return InkWell(
                          onTap: ()=> Get.toNamed(routeName.productDetail,arguments: e.value),
                          child: CartListCard(
                            product: e.value,
                            quantity: "1",
                            minusTap: (){
                              int qunatity = e.value.quantity!;
                              if(qunatity == 1){
                                qunatity =1;
                              }else {
                                qunatity--;
                              }
                              wishListCtrl.update();
                              e.value.quantity = qunatity;
                            },
                            plusTap: (){
                              int qunatity = e.value.quantity!;
                              qunatity++;
                              wishListCtrl.update();
                              e.value.quantity = qunatity;
                            },

                          )
                        );
                      }).toList()
                    ],
                  ).marginSymmetric(horizontal: Insets.i15, vertical: Insets.i15)
                : Column(
mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(imageAssets.noWishlist,height: Sizes.s150,),
                Text('No favourites yet.')
                    .fontSize(FontSizes.s18)
                    .fontWeight(FontWeight.w600),
                Space(0, 10),
                Text('Tap any heart next to a product to favotite. We’ll save them for you here!',textAlign: TextAlign.center,)
                    .fontSize(FontSizes.s14).textHeight(1.5)
                    .fontWeight(FontWeight.normal,).textColor(appCtrl.appTheme.txt).paddingSymmetric(horizontal: Insets.i20,),
                Space(0, 50),
                CustomButton(title: CommonFonts().startShopping,color: appCtrl.appTheme.black,radius: 0,).paddingSymmetric(horizontal: Insets.i20,),
                Space(0, 20),
                CustomButton(title: "SEARCH FOR ITEMS",color: appCtrl.appTheme.grey,radius: 0,fontColor: appCtrl.appTheme.grayPrimary,).paddingSymmetric(horizontal: Insets.i20,),
              ],
            ).width(MediaQuery.of(context).size.width).height(MediaQuery.of(context).size.height).marginOnly(top: MediaQuery.of(context).size.height /10),
          ),
        );
      }
    );
  }
}
