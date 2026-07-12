import 'package:ecommerce_app3/constants/strings.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
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
                "Add Product",
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
              OutlinedButton(onPressed: () {}, child: Text("Add")),
              SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Product")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addCategory(context);
        },
        child: Icon(Icons.add),
      ),
      body: Expanded(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 10.0, // Horizontal space between items
            mainAxisSpacing: 10.0, // Vertical space between items
            childAspectRatio: 0.9, // Width-to-height ratio of cells
          ),

          itemCount: products.length,
          itemBuilder: (context, index) {
            Product product = products[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(12),
                    child: SizedBox(
                      height: 150,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Image.network(product.imageUrl, fit: BoxFit.cover),
                    ),
                  ),
                  Text(product.title),
                ],
              ),
            );
            // return CircleAvatar(
            //   radius: 80,
            //   backgroundImage: NetworkImage(product.imageUrl),
            // );
          },
        ),
      ),
    );
  }
}
