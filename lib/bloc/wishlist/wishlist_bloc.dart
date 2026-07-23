import 'package:ecommerce_app3/bloc/wishlist/wishlist_event.dart';
import 'package:ecommerce_app3/bloc/wishlist/wishlist_state.dart';
import 'package:ecommerce_app3/models/product_model.dart';
import 'package:ecommerce_app3/models/wishlist_model.dart';
import 'package:ecommerce_app3/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  FirebaseService service = FirebaseService();
  List<WishListModel> wishLists = [];
  WishlistBloc() : super(InitialWishList()) {
    on<AddToWishList>((event, emit) async {
      emit(LoadingWishList());
      User? user = await service.getLoginUserInfo();
      if (user != null) {
        await service.addToUserWishList(user.uid, event.wishListModel);
        wishLists = await service.getUserWishList(user.uid);
        emit(LoadedWishList(wishLists));
      } else {
        emit(ErrorWishList());
      }
    });
    on<GetAllWishList>((event, emit) async {
      emit(LoadingWishList());
      User? user = await service.getLoginUserInfo();
      if (user != null) {
        wishLists = await service.getUserWishList(user.uid);
        emit(LoadedWishList(wishLists));
      } else {
        emit(ErrorWishList());
      }
    });
    on<DeleteWishList>((event, emit) async {
      emit(LoadingWishList());
      await service.deleteCart(event.id);
      User? user = await service.getLoginUserInfo();
      if (user != null) {
        wishLists = await service.getUserWishList(user.uid);
        emit(LoadedWishList(wishLists));
      } else {
        emit(ErrorWishList());
      }
    });
    on<GetWishListByProductId>((event, emit) async {
      emit(LoadingWishList());
      WishListModel? data = await service.getWishlistByProductID(
        event.productID,
      );
      if (data != null) {
        emit(ContainWishlist());
      } else {
        emit(DoesnotContainWishlist());
      }
    });
  }
}
