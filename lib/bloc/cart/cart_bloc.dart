import 'package:ecommerce_app3/bloc/cart/cart_event.dart';
import 'package:ecommerce_app3/bloc/cart/cart_state.dart';
import 'package:ecommerce_app3/models/cart_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  List<CartModel> carts = [];
  CartBloc() : super(CartIntial()) {
    on<AddToCart>((event, emit) {
      emit(CartLoading());

      carts.add(event.cart);
      emit(CartLoaded(carts));
    });
    on<GetAllCarts>((event, emit) {
      emit(CartLoading());
      emit(CartLoaded(carts));
    });
  }
}
