import 'package:ecommerce_app3/bloc/wishlist/wishlist_event.dart';
import 'package:ecommerce_app3/bloc/wishlist/wishlist_state.dart';
import 'package:ecommerce_app3/models/product_model.dart';
import 'package:ecommerce_app3/models/wishlist_model.dart';
import 'package:ecommerce_app3/services/firebase_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  FirebaseService service = FirebaseService();
  List<WishListModel> wishLists = [];
  WishlistBloc() : super(InitialWishList()) {
    on<AddToWishList>((event, emit) async {
      emit(LoadingWishList());
      await service.addWishList(event.wishListModel);
      wishLists = await service.getAllWishList();
      emit(LoadedWishList(wishLists));
    });
    on<GetAllWishList>((event, emit) async {
      emit(LoadingWishList());
      wishLists = await service.getAllWishList();
      emit(LoadedWishList(wishLists));
    });
    on<DeleteWishList>((event, emit) async {
      emit(LoadingWishList());
      await service.deleteCart(event.id);
      wishLists = await service.getAllWishList();
      emit(LoadedWishList(wishLists));
    });
  }
}
