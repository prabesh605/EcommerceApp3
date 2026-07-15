import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app3/models/category_model.dart';
import 'package:ecommerce_app3/models/product_model.dart';

class FirebaseService {
  FirebaseFirestore db = FirebaseFirestore.instance;
  String categoryCollection = "category";
  String productCollection = "product";

  // Category add karna
  Future<void> addCategory(Category category) async {
    try {
      await db.collection(categoryCollection).add(category.toJson());
    } catch (e) {
      throw e.toString();
    }
  }

  // Product add karna
  Future<void> addProduct(Product product) async {
    try {
      await db.collection(productCollection).add(product.toJson());
    } catch (e) {
      throw e.toString();
    }
  }

  // Category get karna
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
      return [];
    }
  }

  // Product get karna
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

  // Category update karna (ID ke basis par)
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
// delet catogary
Future <void> deletCatagory (String id )async {
  try {
    await db.collection(categoryCollection).doc(id).delete();
  } catch (e) {
    throw e.toString();
  }

    }

}





