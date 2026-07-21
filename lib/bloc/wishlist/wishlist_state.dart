import 'package:ecommerce_app3/models/product_model.dart';
import 'package:ecommerce_app3/models/wishlist_model.dart';

abstract class WishlistState {}

class InitialWishList extends WishlistState {}

class LoadingWishList extends WishlistState {}

class ErrorWishList extends WishlistState {}

class LoadedWishList extends WishlistState {
  List<WishListModel> wishLists;
  LoadedWishList(this.wishLists);
}
