class Product {
  final String title;
  final String subTitle;
  final String category;
  final String description;
  final double rating;
  final double price;
  final String imageUrl;

  Product({
    required this.title,
    required this.subTitle,
    required this.category,
    required this.description,
    required this.rating,
    required this.price,
    required this.imageUrl,
  });
}

final List<Product> products = [
  Product(
    title: "Matte Lipstick",
    subTitle: "Long-lasting Velvet Finish",
    category: "Beauty",
    description:
        "A premium matte lipstick with rich pigmentation and a smooth, non-drying formula that lasts all day.",
    rating: 3.5,
    price: 19.99,
    imageUrl:
        "https://images.unsplash.com/photo-1596462502278-27bfdc403348?w=500",
  ),
  Product(
    title: "Face Serum",
    subTitle: "Vitamin C Glow Serum",
    category: "Beauty",
    description:
        "Brightens skin tone, reduces dark spots, and keeps your skin hydrated with Vitamin C and Hyaluronic Acid.",
    rating: 4.7,
    price: 29.99,
    imageUrl:
        "https://images.unsplash.com/photo-1620916566398-39f1143ab7be?w=500",
  ),
  Product(
    title: "Luxury Perfume",
    subTitle: "Floral Eau de Parfum",
    category: "Beauty",
    description:
        "An elegant floral fragrance with notes of jasmine, rose, and vanilla for all-day freshness.",
    rating: 4.9,
    price: 79.99,
    imageUrl:
        "https://images.unsplash.com/photo-1541643600914-78b084683601?w=500",
  ),
  Product(
    title: "Men's Jacket",
    subTitle: "Winter Casual Wear",
    category: "Fashion",
    description:
        "Stylish and warm jacket made from premium fabric, perfect for cold weather.",
    rating: 4.6,
    price: 89.99,
    imageUrl:
        "https://images.unsplash.com/photo-1521572267360-ee0c2909d518?w=500",
  ),
  Product(
    title: "Women's Dress",
    subTitle: "Elegant Evening Dress",
    category: "Fashion",
    description:
        "Beautiful evening dress with a modern fit and premium quality fabric.",
    rating: 4.8,
    price: 69.99,
    imageUrl:
        "https://images.unsplash.com/photo-1496747611176-843222e1e57c?w=500",
  ),
  Product(
    title: "Running Sneakers",
    subTitle: "Lightweight Sports Shoes",
    category: "Fashion",
    description:
        "Comfortable sneakers with breathable mesh and cushioned soles for everyday wear.",
    rating: 4.7,
    price: 59.99,
    imageUrl: "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500",
  ),
  Product(
    title: "Kids T-Shirt",
    subTitle: "Soft Cotton Tee",
    category: "Kids",
    description:
        "Comfortable cotton t-shirt with fun prints, perfect for daily wear.",
    rating: 4.5,
    price: 14.99,
    imageUrl:
        "https://images.unsplash.com/photo-1519238263530-99bdd11df2ea?w=500",
  ),
  Product(
    title: "Kids Shoes",
    subTitle: "Comfort Walking Shoes",
    category: "Kids",
    description:
        "Durable and lightweight shoes designed for active kids with anti-slip soles.",
    rating: 4.6,
    price: 34.99,
    imageUrl:
        "https://images.unsplash.com/photo-1514989940723-e8e51635b782?w=500",
  ),
  Product(
    title: "Wireless Headphones",
    subTitle: "Noise Cancelling",
    category: "Electronics",
    description:
        "Premium wireless headphones with immersive sound and up to 30 hours of battery life.",
    rating: 4.9,
    price: 129.99,
    imageUrl:
        "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=500",
  ),
  Product(
    title: "Smart Watch",
    subTitle: "Fitness Tracker",
    category: "Electronics",
    description:
        "Track your health, notifications, and workouts with this stylish smartwatch.",
    rating: 4.8,
    price: 199.99,
    imageUrl:
        "https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=500",
  ),
  Product(
    title: "Gaming Mouse",
    subTitle: "RGB Mechanical Precision",
    category: "Electronics",
    description:
        "Ergonomic gaming mouse with customizable RGB lighting and high-precision sensor.",
    rating: 4.7,
    price: 49.99,
    imageUrl:
        "https://images.unsplash.com/photo-1527814050087-3793815479db?w=500",
  ),
  Product(
    title: "Modern Sofa",
    subTitle: "3-Seater Fabric Sofa",
    category: "Home & Living",
    description:
        "Elegant sofa featuring soft cushions and durable fabric for modern homes.",
    rating: 4.6,
    price: 499.99,
    imageUrl:
        "https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=500",
  ),
  Product(
    title: "Coffee Maker",
    subTitle: "Automatic Brewer",
    category: "Kitchen",
    description:
        "Brew delicious coffee in minutes with programmable settings and a sleek design.",
    rating: 4.8,
    price: 89.99,
    imageUrl:
        "https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=500",
  ),
  Product(
    title: "Mountain Bike",
    subTitle: "21-Speed Bicycle",
    category: "Sports",
    description:
        "High-performance mountain bike with lightweight frame and durable tires.",
    rating: 4.9,
    price: 699.99,
    imageUrl:
        "https://images.unsplash.com/photo-1507035895480-2b3156c31fc8?w=500",
  ),
  Product(
    title: "Leather Backpack",
    subTitle: "Travel & Office Bag",
    category: "Bags",
    description:
        "Premium leather backpack with spacious compartments for work and travel.",
    rating: 4.7,
    price: 74.99,
    imageUrl: "https://images.unsplash.com/photo-1548036328-c9fa89d128fa?w=500",
  ),
  Product(
    title: "Classic Wrist Watch",
    subTitle: "Stainless Steel Edition",
    category: "Watches",
    description:
        "Timeless analog watch with water resistance and premium stainless steel finish.",
    rating: 4.8,
    price: 159.99,
    imageUrl:
        "https://images.unsplash.com/photo-1524805444758-089113d48a6d?w=500",
  ),
  Product(
    title: "Cookware Set",
    subTitle: "Non-Stick 10 Pieces",
    category: "Kitchen",
    description:
        "Complete cookware set with non-stick coating for healthy everyday cooking.",
    rating: 4.6,
    price: 119.99,
    imageUrl: "https://images.unsplash.com/photo-1556911220-bff31c812dba?w=500",
  ),
  Product(
    title: "Novel Collection",
    subTitle: "Best Seller Edition",
    category: "Books",
    description:
        "A collection of bestselling novels perfect for every book lover.",
    rating: 4.9,
    price: 39.99,
    imageUrl:
        "https://images.unsplash.com/photo-1512820790803-83ca734da794?w=500",
  ),
  Product(
    title: "Yoga Mat",
    subTitle: "Eco-Friendly Exercise Mat",
    category: "Sports",
    description:
        "High-density yoga mat with non-slip surface for comfortable workouts.",
    rating: 4.7,
    price: 24.99,
    imageUrl:
        "https://images.unsplash.com/photo-1518611012118-696072aa579a?w=500",
  ),
  Product(
    title: "Indoor Plant",
    subTitle: "Decorative Green Plant",
    category: "Garden",
    description:
        "Beautiful indoor plant that enhances your home décor while improving air quality.",
    rating: 4.8,
    price: 22.99,
    imageUrl:
        "https://images.unsplash.com/photo-1466692476868-aef1dfb1e735?w=500",
  ),
];

class Category {
  final String name;
  final String imageUrl;

  Category({required this.name, required this.imageUrl});
}

final List<Category> categories = [
  Category(
    name: "Beauty",
    imageUrl:
        "https://images.unsplash.com/photo-1596462502278-27bfdc403348?w=500",
  ),
  // Category(
  //   name: "Fashion",
  //   imageUrl:
  //       "https://images.unsplash.com/photo-1496747611176-843222e1e57c?w=500",
  // ),
  Category(
    name: "Kids",
    imageUrl:
        "https://images.unsplash.com/photo-1519238263530-99bdd11df2ea?w=500",
  ),
  Category(
    name: "Electronics",
    imageUrl:
        "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=500",
  ),
  Category(
    name: "Home & Living",
    imageUrl:
        "https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=500",
  ),
  Category(
    name: "Furniture",
    imageUrl:
        "https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=500",
  ),
  Category(
    name: "Sports",
    imageUrl:
        "https://images.unsplash.com/photo-1517649763962-0c623066013b?w=500",
  ),
  Category(
    name: "Books",
    imageUrl:
        "https://images.unsplash.com/photo-1512820790803-83ca734da794?w=500",
  ),
  Category(
    name: "Groceries",
    imageUrl: "https://images.unsplash.com/photo-1542838132-92c53300491e?w=500",
  ),
  // Category(
  //   name: "Health",
  //   imageUrl:
  //       "https://images.unsplash.com/photo-1576091160399-112ba8d25d1f?w=500",
  // ),
  Category(
    name: "Jewelry",
    imageUrl:
        "https://images.unsplash.com/photo-1617038220319-276d3cfab638?w=500",
  ),
  Category(
    name: "Watches",
    imageUrl:
        "https://images.unsplash.com/photo-1524805444758-089113d48a6d?w=500",
  ),
  Category(
    name: "Bags",
    imageUrl: "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500",
  ),
  Category(
    name: "Shoes",
    imageUrl: "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500",
  ),
  Category(
    name: "Toys",
    imageUrl:
        "https://images.unsplash.com/photo-1566576912321-d58ddd7a6088?w=500",
  ),
  Category(
    name: "Pet Supplies",
    imageUrl:
        "https://images.unsplash.com/photo-1517849845537-4d257902454a?w=500",
  ),
  Category(
    name: "Automotive",
    imageUrl:
        "https://images.unsplash.com/photo-1503376780353-7e6692767b70?w=500",
  ),
  Category(
    name: "Office",
    imageUrl:
        "https://images.unsplash.com/photo-1497366754035-f200968a6e72?w=500",
  ),
  Category(
    name: "Garden",
    imageUrl:
        "https://images.unsplash.com/photo-1466692476868-aef1dfb1e735?w=500",
  ),
  Category(
    name: "Kitchen",
    imageUrl: "https://images.unsplash.com/photo-1556911220-bff31c812dba?w=500",
  ),
  Category(
    name: "Gaming",
    imageUrl:
        "https://images.unsplash.com/photo-1493711662062-fa541adb3fc8?w=500",
  ),
  Category(
    name: "Music",
    imageUrl:
        "https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=500",
  ),
  Category(
    name: "Travel",
    imageUrl:
        "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=500",
  ),
  Category(
    name: "Baby",
    imageUrl:
        "https://images.unsplash.com/photo-1515488042361-ee00e0ddd4e4?w=500",
  ),
];
