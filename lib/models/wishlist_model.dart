class WishListModel {
  final String id;
  final String title;
  final String subTitle;
  final String category;
  final String categoryId;
  final String description;
  final double rating;
  final double price;
  final String imageUrl;
  final String productID;

  WishListModel({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.category,
    required this.description,
    required this.rating,
    required this.price,
    required this.imageUrl,
    required this.categoryId,
    required this.productID,
  });
  factory WishListModel.fromJson(Map<String, dynamic> json, String id) {
    return WishListModel(
      id: id,
      title: json['title'],
      subTitle: json['subTitle'],
      category: json['category'],
      description: json['description'],
      rating: (json['rating'] as num)?.toDouble() ?? 0.0,
      price: (json['price'] as num)?.toDouble() ?? 0.0,
      imageUrl: json['imageUrl'],
      categoryId: json['categoryId'],
      productID: json['productID'],
    );
  }
  Map<String, dynamic> toJson() => {
    "title": title,
    "subTitle": subTitle,
    "category": category,
    "description": description,
    "rating": rating,
    "price": price,
    "imageUrl": imageUrl,
    "categoryId": categoryId,
    "productID": productID,
  };
}
