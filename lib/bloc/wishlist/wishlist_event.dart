import 'package:ecommerce_app3/models/wishlist_model.dart';

abstract class WishlistEvent {}

class AddToWishList extends WishlistEvent {
  WishListModel wishListModel;
  AddToWishList(this.wishListModel);
}

class GetAllWishList extends WishlistEvent {}

class GetWishListByProductId extends WishlistEvent {
  String productID;
  GetWishListByProductId(this.productID);
}

class DeleteWishList extends WishlistEvent {
  String id;
  DeleteWishList(this.id);
}
