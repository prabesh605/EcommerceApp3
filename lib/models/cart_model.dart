class CartModel {
  //
  final String id;
  final String title;
  final String subTitle;
  final String category;
  final String categoryId;
  final String description;
  final double rating;
  final double price;
  final String imageUrl;
  final String user;
  final int quantity;
  CartModel({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.category,
    required this.categoryId,
    required this.description,
    required this.rating,
    required this.price,
    required this.imageUrl,
    required this.user,
    required this.quantity,
  });
  factory CartModel.fromJson(Map<String, dynamic> json, String id) {
    return CartModel(
      id: id,
      title: json['title'],
      subTitle: json['subTitle'],
      category: json['category'],
      categoryId: json['categoryId'],
      description: json['description'],
      rating: json['rating'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      user: json['user'],
      quantity: json['quantity'],
    );
  }
  Map<String, dynamic> toJson() => {
    "title": title,
    'subTitle': subTitle,
    'category': category,
    "categoryId": categoryId,
    "description": description,
    "rating": rating,
    "price": price,
    "imageUrl": imageUrl,
    "user": user,
    "quantity": quantity,
  };
}
