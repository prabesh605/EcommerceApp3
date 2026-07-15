import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app3/models/category_model.dart';
import 'package:ecommerce_app3/models/product_model.dart';

class FirebaseService {
  FirebaseFirestore db = FirebaseFirestore.instance;
  String categoryCollection = "category";
  String productCollection = "product";

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
}
