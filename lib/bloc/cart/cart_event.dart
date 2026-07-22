import 'package:ecommerce_app3/models/cart_model.dart';

abstract class CartEvent {}

class AddToCart extends CartEvent {
  final CartModel cart;
  AddToCart(this.cart);
}

class GetAllCarts extends CartEvent {}
