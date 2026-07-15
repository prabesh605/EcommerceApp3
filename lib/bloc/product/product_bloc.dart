import 'package:ecommerce_app3/bloc/product/product_event.dart';
import 'package:ecommerce_app3/bloc/product/product_state.dart';
import 'package:ecommerce_app3/models/product_model.dart';
import 'package:ecommerce_app3/services/firebase_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  FirebaseService firebaseService = FirebaseService();
  List<Product> product = [];
  ProductBloc() : super(ProductInitial()) {
    on<GetProduct>((event, emit) async {
      emit(ProductLoading());
      product = await firebaseService.getProduct();
      emit(ProductLoaded(product));
    });
    on<AddProduct>((event, emit) async {
      emit(ProductLoading());
      await firebaseService.addProduct(event.product);
      product = await firebaseService.getProduct();
      emit(ProductLoaded(product));
    });
    on<EditProduct>((event, emit) async {
      emit(ProductLoading());
      await firebaseService.updateProduct(event.product);
      product = await firebaseService.getProduct();
      emit(ProductLoaded(product));
    });
  }
}
