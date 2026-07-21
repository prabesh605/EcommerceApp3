import 'package:ecommerce_app3/bloc/cart/cart_event.dart';
import 'package:ecommerce_app3/bloc/cart/cart_state.dart';
import 'package:ecommerce_app3/models/cart_model.dart';
import 'package:ecommerce_app3/services/firebase_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  List<CartModel> carts = [];

  FirebaseService firebaseService = FirebaseService();
  CartBloc() : super(CartIntial()) {
    on<AddToCart>((event, emit) async {
      emit(CartLoading());
      await firebaseService.addToCart(event.cart);
      // carts.add(event.cart);
      carts = await firebaseService.getAllCarts();
      emit(CartLoaded(carts));
    });
    on<GetAllCarts>((event, emit) async {
      emit(CartLoading());
      carts = await firebaseService.getAllCarts();
      emit(CartLoaded(carts));
    });
  }
}
