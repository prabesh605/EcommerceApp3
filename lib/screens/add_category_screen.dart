import 'package:ecommerce_app3/bloc/category/category_bloc.dart';
import 'package:ecommerce_app3/bloc/category/category_event.dart';
import 'package:ecommerce_app3/bloc/category/category_state.dart';
import 'package:ecommerce_app3/constants/strings.dart';
import 'package:ecommerce_app3/models/category_model.dart';
import 'package:ecommerce_app3/services/firebase_service.dart';
import 'package:ecommerce_app3/services/image_service.dart';
import 'package:firebase_core/firebase_core.dart' as firebase;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({super.key});

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  // FirebaseService firebase = FirebaseService();
  // List<Category> categories = [];
  UploadImageService uploadImageService = UploadImageService();
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
              SizedBox(height: 10),
              Text(
                cat != null ? "Update Category" : "Add Category",
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
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: imageController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Image"),
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      uploadImageService.selectImage();
                    },
                    child: Text("Upload"),
                  ),
                ],
              ),
              SizedBox(height: 10),
              OutlinedButton(
                onPressed: () {
                  // Map<String, dynamic> category = {
                  //   'Name': nameController.text,
                  //   "Image": imageController.text,
                  // };
                  Category category = Category(
                    id: cat != null ? cat.id : "",
                    name: nameController.text,
                    imageUrl: imageController.text,
                  );
                  if (cat != null) {
                    context.read<CategoryBloc>().add(UpdateCategory(category));
                    // firebase.updateCategory(category);
                  } else {
                    context.read<CategoryBloc>().add(AddCatgory(category));
                    // firebase.addCategory(category);
                  }
                  Navigator.pop(context);
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
    context.read<CategoryBloc>().add(GetCategory());
    // categories = await firebase.getCategory();
    // setState(() {});
    // print(categories);
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
          addCategory(context, null);
        },
        child: Icon(Icons.add),
      ),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is LoadingCategory) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ErrorCategory) {
            return Center(child: Text(state.error));
          } else if (state is CategoryLoaded) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 10.0, // Horizontal space between items
                mainAxisSpacing: 10.0, // Vertical space between items
                childAspectRatio: 0.7, // Width-to-height ratio of cells
              ),

              itemCount: state.categories.length,
              itemBuilder: (context, index) {
                Category category = state.categories[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(12),
                        child: SizedBox(
                          height: 150,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Image.network(
                            category.imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.error);
                            },
                          ),
                        ),
                      ),
                      Text(category.name),
                      ElevatedButton(
                        onPressed: () {
                          addCategory(context, category);
                        },
                        child: Text("Edit"),
                      ),
                    ],
                  ),
                );
                // return CircleAvatar(
                //   radius: 80,
                //   backgroundImage: NetworkImage(product.imageUrl),
                // );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
