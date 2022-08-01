class ProductViewModel {
  String? image;
  String? name;
  double? price;
  double? discountPrice;
  bool? isInStock;
  bool? isFav;

  ProductViewModel({required this.image, this.name,this.price,this.discountPrice,this.isInStock,this.isFav});

  factory ProductViewModel.fromJson(Map<String, dynamic> json) {
    return ProductViewModel(
      name: json['name'] as String?,
      image: json['image'] as String?,
      price: json['price'] as double?,
      discountPrice: json['discountPrice'] as double?,
      isInStock: json['isInStock'] as bool?,
      isFav: json['isFav'] as bool?,
    );
  }
}
