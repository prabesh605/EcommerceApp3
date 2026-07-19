import 'package:ecommerce_app3/models/cart_model.dart';

abstract class CartState {}

class CartIntial extends CartState {}

class CartLoading extends CartState {}

class CartError extends CartState {}

class CartLoaded extends CartState {
  final List<CartModel> carts;
  CartLoaded(this.carts);
}
