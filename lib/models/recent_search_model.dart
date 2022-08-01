class RecentSearchModel {
  String? image;
  String? title;

  RecentSearchModel({required this.image, this.title});

  factory RecentSearchModel.fromJson(Map<String, dynamic> json) {
    return RecentSearchModel(
      title: json['title'] as String?,
      image: json['image'] as String?,
    );
  }
}
