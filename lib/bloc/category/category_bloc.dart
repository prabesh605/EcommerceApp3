import 'package:ecommerce_app3/bloc/category/category_event.dart';
import 'package:ecommerce_app3/bloc/category/category_state.dart';
import 'package:ecommerce_app3/models/category_model.dart';
import 'package:ecommerce_app3/services/firebase_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  FirebaseService service = FirebaseService();
  List<Category> categories = [];
  CategoryBloc() : super(InitialCategory()) {
    on<GetCategory>((event, emit) async {
      emit(LoadingCategory());
      categories = await service.getCategory();
      emit(CategoryLoaded(categories));
    });
    on<AddCatgory>((event, emit) async {
      emit(LoadingCategory());
      await service.addCategory(event.category);
      categories = await service.getCategory();
      emit(CategoryLoaded(categories));
    });
    on<UpdateCategory>((event, emit) async {
      emit(LoadingCategory());
      await service.updateCategory(event.category);
      categories = await service.getCategory();
      emit(CategoryLoaded(categories));
    });
  }
}
