import '../../config.dart';

var womenCollectionList = <ProductViewModel>[
  ProductViewModel(
      image: imageAssets.womenCollection1,
      price: 50.00,
      name: "Shoes",
      isFav: false,
      discountPrice: 10.00,
      isInStock: true),
  ProductViewModel(
      image: imageAssets.womenCollection2,
      price: 40.00,
      name: "Clothing",
      discountPrice: 5.00,
      isFav: false,
      isInStock: false),
  ProductViewModel(
      image: imageAssets.womenCollection3,
      price: 100.00,
      name: "Accessories",
      isFav: false,
      discountPrice: 20.00,
      isInStock: true),
];
