import 'package:ecommerce_app3/models/category_model.dart';

abstract class CategoryState {}

class InitialCategory extends CategoryState {}

class LoadingCategory extends CategoryState {}

class ErrorCategory extends CategoryState {
  final String error;
  ErrorCategory(this.error);
}

class CategoryLoaded extends CategoryState {
  List<Category> categories;
  CategoryLoaded(this.categories);
}
