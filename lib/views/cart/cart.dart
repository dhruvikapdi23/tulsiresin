import 'package:tulsiresin/common/array/product.dart';
import 'package:tulsiresin/config.dart';
import 'package:tulsiresin/controllers/cart_controller.dart';
import 'package:tulsiresin/views/cart/widgets/cart_list_card.dart';
import 'package:tulsiresin/views/cart/widgets/checkout_button.dart';
import 'package:tulsiresin/views/cart/widgets/price_layout.dart';
import 'package:tulsiresin/views/home/widgets/recent_view_list.dart';
import 'package:tulsiresin/widgets/common/custom_button.dart';

class Cart extends StatelessWidget {
  final cartCtrl = Get.put(CartController());

  Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (_) {
      return Scaffold(
        backgroundColor: appCtrl.appTheme.surface,
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: appCtrl.appTheme.surface,
          title: Text(CommonFonts().myCart),
          actions: [
            CheckoutButton(
              onTap: () => Get.toNamed(routeName.checkOut),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              cartCtrl.cartList.isNotEmpty ?  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...cartCtrl.cartList.asMap().entries.map((e) {
                    return CartListCard(
                      product: e.value,
                      quantity: "1",
                      optionLength: e.value.options!.length,
                      /*minusTap: (){
                        int qunatity = e.value.quantity!;
                        if(qunatity == 1){
                          qunatity =1;
                        }else {
                          qunatity--;
                        }
                        cartCtrl.update();
                        e.value.quantity = qunatity;
                      },
                      plusTap: (){
                        int qunatity = e.value.quantity!;
                        qunatity++;
                        cartCtrl.update();
                        e.value.quantity = qunatity;
                      },*/
                    ).gestures(onTap:()=> Get.toNamed(routeName.productDetail,arguments: e.value),);
                  }).toList(),
                  const PriceLayout(),
                  Space(0, 20),
                ],
              ): Column(

                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width,child:  Text(CommonFonts().youBagIsEmpty,textAlign: TextAlign.center,).fontSize(FontSizes.s18).fontWeight(FontWeight.w600).width(MediaQuery.of(context).size.width)),
                      SizedBox(width: MediaQuery.of(context).size.width,child: Image.asset(imageAssets.emptyCart,height: Sizes.s100,width: Sizes.s150,alignment: Alignment.centerRight,)),
                    ],
                  ),
                  Text(CommonFonts().emptyDes).paddingSymmetric(horizontal: Insets.i50)
                ],
              ).marginOnly(bottom: Insets.i50),

              CustomButton(
                title: cartCtrl.cartList.isNotEmpty ?CommonFonts().clearChart :CommonFonts().startShopping,
                color: appCtrl.appTheme.black,
                radius: 0,
                style: TextStyle(
                  fontWeight: cartCtrl.cartList.isNotEmpty ? FontWeight.normal : FontWeight.w700,
                  color: appCtrl.appTheme.surface
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(CommonFonts().myWishList)
                      .fontSize(FontSizes.s18)
                      .textColor(appCtrl.appTheme.black),
                  Text(CommonFonts().showAll)
                      .fontSize(FontSizes.s14)
                      .textColor(appCtrl.appTheme.primary).gestures(onTap: ()=>Get.toNamed(routeName.product))
                ],
              ).marginSymmetric(vertical: Insets.i50),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                   /* ...geRecentProducts.asMap().entries.map((e) {
                      return RecentViewListCard(
                        data: e.value,
                        index: e.key,
                        onTap: ()=> Get.toNamed(routeName.productDetail,arguments: e.value),
                        heartIconTap: (){
                          *//*e.value.isFav = !e.value.isFav!;
                          cartCtrl.update();*//*
                        },
                      );
                    })*/
                  ],
                ),
              ),
            ],
          ).marginSymmetric(horizontal: Insets.i20,vertical: Insets.i15),
        ),
      );
    });
  }
}
