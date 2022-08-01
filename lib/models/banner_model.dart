class BannerModel {
  String? image;
  String? title;
  String? description;

  BannerModel({required this.image, this.title,this.description});

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      title: json['title'] as String?,
      image: json['image'] as String?,
      description: json['description'] as String?,
    );
  }
}
