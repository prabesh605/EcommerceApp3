import 'package:ecommerce_app3/bloc/category/category_bloc.dart';
import 'package:ecommerce_app3/bloc/category/category_event.dart';
import 'package:ecommerce_app3/bloc/category/category_state.dart';
import 'package:ecommerce_app3/bloc/imageUpload/imageUpload_bloc.dart';
import 'package:ecommerce_app3/bloc/imageUpload/imageUpload_event.dart';
import 'package:ecommerce_app3/bloc/imageUpload/imageUpload_state.dart';
import 'package:ecommerce_app3/bloc/product/product_bloc.dart';
import 'package:ecommerce_app3/bloc/product/product_event.dart';
import 'package:ecommerce_app3/bloc/product/product_state.dart';
import 'package:ecommerce_app3/models/category_model.dart';
import 'package:ecommerce_app3/models/product_model.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:ecommerce_app3/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  // FirebaseService firebase = FirebaseService();
  Category? selectedCategory;
  // List<Category> categories = [];

  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController categoryIdController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController ratingController = TextEditingController(text: "5");
  TextEditingController priceController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  void addCategory(BuildContext context, Product? product) {
    // selectedCategory = categories.map((cat) => cat.id = product.id);
    // selectedCategory = Category(
    //   id: product?.id ?? "",
    //   name: "name",
    //   imageUrl: "imageUrl",
    // );
    titleController.text = product?.title ?? "";
    subtitleController.text = product?.subTitle ?? "";
    categoryController.text = product?.category ?? "";
    categoryIdController.text = product?.categoryId ?? "";
    descriptionController.text = product?.description ?? "";
    ratingController.text = "${product?.rating ?? "0"}";
    priceController.text = "${product?.price ?? "0"}";
    imageController.text = product?.imageUrl ?? "";

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
                  product != null ? "Update Product" : "Add Product",
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
                BlocBuilder<CategoryBloc, CategoryState>(
                  builder: (context, state) {
                    if (state is LoadingCategory) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is ErrorCategory) {
                      return Center(child: Text(state.error));
                    } else if (state is CategoryLoaded) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(),
                        ),
                        child: DropdownButton(
                          // value: selectedCategory,
                          padding: EdgeInsets.all(6),
                          borderRadius: BorderRadius.circular(12),
                          isExpanded: true,

                          items: state.categories
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
                            categoryIdController.text = "$value";
                          },
                        ),
                      );
                    }
                    return Container();
                  },
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
                        //
                        context.read<ImageuploadBloc>().add(UploadImage());
                      },
                      child: Text("Upload"),
                    ),
                  ],
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
                    Product prod = Product(
                      id: product != null ? product.id : '',
                      title: titleController.text,
                      subTitle: subtitleController.text,
                      category: categoryController.text,
                      description: descriptionController.text,
                      rating: double.parse(ratingController.text),
                      price: double.parse(priceController.text),
                      imageUrl: imageController.text,
                      categoryId: categoryIdController.text,
                    );
                    // product != null
                    //     ? firebase.updateProduct(prod)
                    //     : firebase.addProduct(prod);

                    product != null
                        ? context.read<ProductBloc>().add(EditProduct(prod))
                        : context.read<ProductBloc>().add(AddProduct(prod));
                    Navigator.pop(context);
                  },
                  child: Text(product != null ? "Update" : "Add"),
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
    context.read<CategoryBloc>().add(GetCategory());
  }

  @override
  void initState() {
    getCategory();
    context.read<ProductBloc>().add(GetProduct());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Product")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addCategory(context, null);
        },
        child: Icon(Icons.add),
      ),
      body: BlocListener<ImageuploadBloc, ImageuploadState>(
        listener: (context, state) {
          if (state is ImageLoading) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(child: Text("Loading..."));
              },
            );
          }
          if (state is ImageLoaded) {
            Navigator.pop(context);
            imageController.text = state.url;
          }
        },
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ProductError) {
              return Center(child: Text("error"));
            } else if (state is ProductLoaded) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 10.0, // Horizontal space between items
                  mainAxisSpacing: 10.0, // Vertical space between items
                  childAspectRatio: 0.8, // Width-to-height ratio of cells
                ),

                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  Product product = state.products[index];
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
                              product.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(product.title),
                        OutlinedButton(
                          onPressed: () {
                            addCategory(context, product);
                          },
                          child: Text('Edit'),
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
      ),
    );
  }
}
