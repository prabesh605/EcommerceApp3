import 'package:ecommerce_app3/models/category_model.dart';
import 'package:ecommerce_app3/services/firebase_service.dart';
import 'package:firebase_core/firebase_core.dart' as firebase;
import 'package:flutter/material.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({super.key});

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  FirebaseService firebase = FirebaseService();
  List<Category> categories = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  void addCategory(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10),
              Text(
                "Add Category",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Name"),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: imageController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Image"),
                ),
              ),
              SizedBox(height: 10),
              OutlinedButton(
                onPressed: () {
                  // Map<String, dynamic> category = {
                  //   'Name': nameController.text,
                  //   "Image": imageController.text,
                  // };
                  Category category = Category(
                    id: "",
                    name: nameController.text,
                    imageUrl: imageController.text,
                  );

                  firebase.addCategory(category);
                },
                child: Text("Add"),
              ),
              SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  Future<void> getCategory() async {
    categories = await firebase.getCategory();
    setState(() {});
    print(categories);
  }

  @override
  void initState() {
    getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Category")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addCategory(context);
        },
        child: Icon(Icons.add),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 10.0, // Horizontal space between items
          mainAxisSpacing: 10.0, // Vertical space between items
          childAspectRatio: 0.9, // Width-to-height ratio of cells
        ),

        itemCount: categories.length,
        itemBuilder: (context, index) {
          Category category = categories[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(12),
                  child: SizedBox(
                    height: 150,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Image.network(category.imageUrl, fit: BoxFit.cover),
                  ),
                ),
                Text(category.name),
              ],
            ),
          );
          // return CircleAvatar(
          //   radius: 80,
          //   backgroundImage: NetworkImage(product.imageUrl),
          // );
        },
      ),
    );
  }
}
