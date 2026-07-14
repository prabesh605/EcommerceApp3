class Product {
  final String id;
  final String title;
  final String subTitle;
  final String category;
  final String categoryId;
  final String description;
  final double rating;
  final double price;
  final String imageUrl;

  Product({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.category,
    required this.description,
    required this.rating,
    required this.price,
    required this.imageUrl,
    required this.categoryId,
  });
  factory Product.fromJson(Map<String, dynamic> json, String id) {
    return Product(
      id: id,
      title: json['title'],
      subTitle: json['subTitle'],
      category: json['category'],
      description: json['description'],
      rating: json['rating'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      categoryId: json['categoryId'],
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
  };
}
