import 'package:ecommerce_app3/models/category_model.dart';
import 'package:ecommerce_app3/models/product_model.dart';
import 'package:ecommerce_app3/services/firebase_service.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  FirebaseService firebase = FirebaseService();
  List<Category> categories = [];
  List<Product> products = [];
  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController categoryIdController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController ratingController = TextEditingController(text: "5");
  TextEditingController priceController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  void addCategory(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(height: 10),
                Text(
                  "Add Product",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Title"),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: subtitleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("SubTitle"),
                  ),
                ),
                SizedBox(height: 10),
                // TextFormField(
                //   controller: categoryController,
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(),
                //     label: Text("Category"),
                //   ),
                // ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(),
                  ),
                  child: DropdownButton(
                    padding: EdgeInsets.all(6),
                    borderRadius: BorderRadius.circular(12),
                    isExpanded: true,
                    items: categories
                        .map(
                          (cat) => DropdownMenuItem(
                            value: cat.id,
                            child: Text(cat.name),
                          ),
                        )
                        .toList(),
                    // items: [
                    //   DropdownMenuItem(value: 1, child: Text("category1")),
                    //   DropdownMenuItem(value: 2, child: Text("category2")),
                    // ],
                    onChanged: (value) {
                      print(value);
                      categoryIdController.text = value ?? "";
                    },
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Description"),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  readOnly: true,
                  controller: ratingController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Rating"),
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
                TextFormField(
                  controller: priceController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Price"),
                  ),
                ),
                SizedBox(height: 10),
                OutlinedButton(
                  onPressed: () {
                    Product product = Product(
                      id: '',
                      title: titleController.text,
                      subTitle: subtitleController.text,
                      category: categoryController.text,
                      description: descriptionController.text,
                      rating: double.parse(ratingController.text),
                      price: double.parse(priceController.text),
                      imageUrl: imageController.text,
                      categoryId: categoryIdController.text,
                    );
                    firebase.addProduct(product);
                    getProduct();
                    Navigator.pop(context);
                  },
                  child: Text("Add"),
                ),
                SizedBox(height: 10),
              ],
            ),
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

  Future<void> getProduct() async {
    products = await firebase.getProduct();
    setState(() {});
  }

  @override
  void initState() {
    getCategory();
    getProduct();
    super.initState();
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
      body: GridView.builder(
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
    );
  }
}
