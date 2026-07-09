class Product {
  final String name;
  final String category;
  final String imageUrl;

  Product({required this.name, required this.category, required this.imageUrl});
}

final List<Product> products = [
  Product(
    name: "Matte Lipstick",
    category: "Beauty",
    imageUrl:
        "https://images.unsplash.com/photo-1596462502278-27bfdc403348?w=500",
  ),
  Product(
    name: "Face Serum",
    category: "Beauty",
    imageUrl:
        "https://images.unsplash.com/photo-1620916566398-39f1143ab7be?w=500",
  ),
  Product(
    name: "Perfume",
    category: "Beauty",
    imageUrl:
        "https://images.unsplash.com/photo-1541643600914-78b084683601?w=500",
  ),
  Product(
    name: "Men's Jacket",
    category: "Fashion",
    imageUrl:
        "https://images.unsplash.com/photo-1521572267360-ee0c2909d518?w=500",
  ),
  Product(
    name: "Women's Dress",
    category: "Fashion",
    imageUrl:
        "https://images.unsplash.com/photo-1496747611176-843222e1e57c?w=500",
  ),
  Product(
    name: "Sneakers",
    category: "Fashion",
    imageUrl: "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500",
  ),
  Product(
    name: "Kids T-Shirt",
    category: "Kids",
    imageUrl:
        "https://images.unsplash.com/photo-1519238263530-99bdd11df2ea?w=500",
  ),

  Product(
    name: "Kids Shoes",
    category: "Kids",
    imageUrl:
        "https://images.unsplash.com/photo-1514989940723-e8e51635b782?w=500",
  ),
];
