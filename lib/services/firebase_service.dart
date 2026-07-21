import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app3/models/cart_model.dart';
import 'package:ecommerce_app3/models/category_model.dart';
import 'package:ecommerce_app3/models/product_model.dart';
import 'package:ecommerce_app3/models/wishlist_model.dart';

class FirebaseService {
  FirebaseFirestore db = FirebaseFirestore.instance;
  String categoryCollection = "category";
  String productCollection = "product";
  String cartCollection = "cart";
  String wishListCollection = 'wishlist';

  //category
  Future<void> addCategory(Category category) async {
    try {
      await db.collection(categoryCollection).add(category.toJson());
    } catch (e) {
      throw e.toString();
    }
  }

  //product
  Future<void> addProduct(Product product) async {
    try {
      await db.collection(productCollection).add(product.toJson());
    } catch (e) {
      throw e.toString();
    }
  }

  //cart
  Future<void> addToCart(CartModel cart) async {
    try {
      await db.collection(cartCollection).add(cart.toJson());
    } catch (e) {
      e.toString();
    }
  }

  //wishlist
  Future<void> addWishList(WishListModel wishlist) async {
    try {
      await db.collection(wishListCollection).add(wishlist.toJson());
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<Category>> getCategory() async {
    try {
      QuerySnapshot querySnapshot = await db
          .collection(categoryCollection)
          .get();
      List<Category> category = querySnapshot.docs
          .map(
            (doc) =>
                Category.fromJson(doc.data() as Map<String, dynamic>, doc.id),
          )
          .toList();
      return category;
    } catch (e) {
      print(e.toString());
      // e.toString();
      return [];
    }
  }

  Future<List<Product>> getProduct() async {
    try {
      QuerySnapshot querySnapshot = await db
          .collection(productCollection)
          .get();
      List<Product> product = querySnapshot.docs
          .map(
            (doc) =>
                Product.fromJson(doc.data() as Map<String, dynamic>, doc.id),
          )
          .toList();
      return product;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<CartModel>> getAllCarts() async {
    try {
      QuerySnapshot querySnapshot = await db.collection(cartCollection).get();

      return querySnapshot.docs
          .map(
            (doc) =>
                CartModel.fromJson(doc.data() as Map<String, dynamic>, doc.id),
          )
          .toList();
      // return CartModel.fromJson(
      //   querySnapshot.docs.first.data() as Map<String, dynamic>,
      //   querySnapshot.docs.first.id,
      // );
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<WishListModel>> getAllWishList() async {
    try {
      QuerySnapshot querySnapshot = await db
          .collection(wishListCollection)
          .get();
      return querySnapshot.docs
          .map(
            (doc) => WishListModel.fromJson(
              doc.data() as Map<String, dynamic>,
              doc.id,
            ),
          )
          .toList();
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> updateCategory(Category category) async {
    try {
      await db
          .collection(categoryCollection)
          .doc(category.id)
          .update(category.toJson());
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> updateProduct(Product product) async {
    try {
      await db
          .collection(productCollection)
          .doc(product.id)
          .update(product.toJson());
    } catch (e) {
      e.toString();
    }
  }

  Future<void> deleteCart(String id) async {
    try {
      await db.collection(wishListCollection).doc(id).delete();
    } catch (e) {
      throw e.toString();
    }
  }

  //byid
  // Future<WishListModel> getWishlistByProductID(String id) async {
  //   try {} catch (e) {
  //     throw e.toString();
  //   }
  // }
}
