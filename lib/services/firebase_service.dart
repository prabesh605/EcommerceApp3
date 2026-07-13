import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app3/models/category_model.dart';

class FirebaseService {
  FirebaseFirestore db = FirebaseFirestore.instance;
  String categoryCollection = "category";
  String productCollection = "product";
  Future<void> addCategory(Category category) async {
    try {
      await db.collection(categoryCollection).add(category.toJson());
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
}
