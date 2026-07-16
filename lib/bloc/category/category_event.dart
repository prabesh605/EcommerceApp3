import 'package:ecommerce_app3/models/category_model.dart';

abstract class CategoryEvent {}

class GetCategory extends CategoryEvent {}

class AddCatgory extends CategoryEvent {
  final Category category;
  AddCatgory(this.category);
}

class UpdateCategory extends CategoryEvent {
  final Category category;
  UpdateCategory(this.category);
}
