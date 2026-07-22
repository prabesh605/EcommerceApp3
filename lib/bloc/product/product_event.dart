import 'package:ecommerce_app3/models/product_model.dart';

abstract class ProductEvent {}

class GetProduct extends ProductEvent {}

class AddProduct extends ProductEvent {
  final Product product;
  AddProduct(this.product);
}

class EditProduct extends ProductEvent {
  final Product product;
  EditProduct(this.product);
}
