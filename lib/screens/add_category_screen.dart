import 'package:ecommerce_app3/constants/strings.dart';
import 'package:ecommerce_app3/models/category_model.dart';
import 'package:ecommerce_app3/services/firebase_service.dart';
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

  void addCategory(BuildContext context, Category? cat) {
    nameController.text = cat?.name ?? "";
    imageController.text = cat?.imageUrl ?? "";

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              Text(
                cat != null ? "Update Category" : "Add Category",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Name"),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: imageController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Image URL"),
                ),
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                onPressed: () async {
                  Category category = Category(
                    id: cat != null ? cat.id : "",
                    name: nameController.text,
                    imageUrl: imageController.text,
                  );

                  if (cat != null) {
                    await firebase.updateCategory(category);
                  } else {
                    await firebase.addCategory(category);
                  }

                  await getCategory();
                  Navigator.pop(context);
                },
                child: Text(cat != null ? "Update" : "Add"),
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  Future<void> getCategory() async {
    categories = await firebase.getCategory();
    setState(() {});
  }

  @override
  void initState() {
    getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Category")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addCategory(context, null);
        },
        child: const Icon(Icons.add),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.85,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          Category category = categories[index];
          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      height: 120,
                      width: double.infinity,
                      child: Image.network(category.imageUrl, fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    category.name,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  SizedBox(
                    height: 28,
                    width: double.infinity,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () {
                        addCategory(context, category);
                      },
                      child: const Text("Edit", style: TextStyle(fontSize: 11)),
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: 28,
                    width: double.infinity,

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () async {
                        await firebase.deletCatagory(category.id);
                        await getCategory();
                      },
                      child: const Text("Delete", style: TextStyle(color: Colors.white, fontSize: 11)),
                    ),

                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}