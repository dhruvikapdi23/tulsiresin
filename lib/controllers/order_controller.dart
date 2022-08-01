import 'package:tulsiresin/config.dart';
import 'package:tulsiresin/models/order_detail_model.dart';
import 'package:tulsiresin/routes/screen_list.dart';

class OrderDetailController extends GetxController {
  var orderDetail = OrderDetailModel(
      lineItems: [
        LineItems(
          id: "11446452125854",
          adminGraphqlApiId: "gid:\/\/shopify\/LineItem\/11446452125854",
          fulfillableQuantity: "1",
          fulfillmentService: "manual",
          fulfillmentStatus: null,
          giftCard: false,
          grams: "0",
          name: "Man T-shirt",
          price: 20.00,
          priceSet: PriceSet(
              presentmentMoney: ShopMoney(amount: "0.10", currencyCode: "INR"),
              shopMoney: ShopMoney(amount: "0.10", currencyCode: "INR")),
          productExists: true,
          productId: "7257212715166",
          quantity: "2",
          requiresShipping: true,
          sku: "VN-06-light_brown-10",
          taxable: true,
          title: "VANS | ERA 59 (DESERT COWBOY)",
          totalDiscount: "0.00",
          totalDiscountSet: PriceSet(
              presentmentMoney: ShopMoney(amount: "0.10", currencyCode: "INR"),
              shopMoney: ShopMoney(amount: "0.10", currencyCode: "INR")),
          variantId: "41842358452382",
          variantInventoryManagement: "shopify",
          variantTitle: "10 \/ light_brown",
          vendor: "VANS",
        ),
        LineItems(
          id: "11446452125854",
          adminGraphqlApiId: "gid:\/\/shopify\/LineItem\/11446452125854",
          fulfillableQuantity: "1",
          fulfillmentService: "manual",
          fulfillmentStatus: null,
          giftCard: false,
          grams: "0",
          name: "Man T-shirt",
          price: 30.00,
          priceSet: PriceSet(
              presentmentMoney: ShopMoney(amount: "0.10", currencyCode: "INR"),
              shopMoney: ShopMoney(amount: "0.10", currencyCode: "INR")),
          productExists: true,
          productId: "7257212715166",
          quantity: "4",
          requiresShipping: true,
          sku: "VN-06-light_brown-10",
          taxable: true,
          title: "VANS | ERA 59 (DESERT COWBOY)",
          totalDiscount: "0.00",
          totalDiscountSet: PriceSet(
              presentmentMoney: ShopMoney(amount: "0.10", currencyCode: "INR"),
              shopMoney: ShopMoney(amount: "0.10", currencyCode: "INR")),
          variantId: "41842358452382",
          variantInventoryManagement: "shopify",
          variantTitle: "10 \/ light_brown",
          vendor: "VANS",
        )
      ],
      shippingAddress: ShippingAddress(
          name: "Xanthus",
          firstName: "Xanthus",
          address1: "5758 A, Street",
          phone: "+41338858326",
          city: "Hyeres",
          zip: "82995",
          province: "Canton of Bern",
          country: "Switzerland",
          lastName: "Porter",
          address2: null,
          company: null,
          latitude: null,
          longitude: null,
          countryCode: "CH",
          provinceCode: null),
      shippingCharges: 00.00,
      totalAmount: 50.00,status: "Pending");
}
