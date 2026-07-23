import 'package:ecommerce_app3/bloc/cart/cart_event.dart';
import 'package:ecommerce_app3/bloc/cart/cart_state.dart';
import 'package:ecommerce_app3/models/cart_model.dart';
import 'package:ecommerce_app3/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  List<CartModel> carts = [];

  FirebaseService firebaseService = FirebaseService();
  CartBloc() : super(CartIntial()) {
    on<AddToCart>((event, emit) async {
      emit(CartLoading());
      User? user = await firebaseService.getLoginUserInfo();
      if (user != null) {
        await firebaseService.addToUserCart(user.uid, event.cart);
        carts = await firebaseService.getAllUserCarts(user.uid);
        emit(CartLoaded(carts));
      } else {
        emit(CartError());
      }

      // carts.add(event.cart);
    });
    on<GetAllCarts>((event, emit) async {
      emit(CartLoading());
      User? user = await firebaseService.getLoginUserInfo();
      if (user != null) {
        carts = await firebaseService.getAllUserCarts(user.uid);
        emit(CartLoaded(carts));
      } else {
        emit(CartError());
      }
    });
  }
}
