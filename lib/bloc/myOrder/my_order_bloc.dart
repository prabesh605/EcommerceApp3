import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app3/bloc/myOrder/my_order_event.dart';
import 'package:ecommerce_app3/bloc/myOrder/my_order_state.dart';
import 'package:ecommerce_app3/models/order_model.dart';
import 'package:ecommerce_app3/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrderBloc extends Bloc<MyOrderEvent, MyOrderState> {
  FirebaseService service = FirebaseService();
  MyOrderBloc() : super(MyOrderInitial()) {
    on<GetMyOrder>((event, emit) async {
      emit(MyOrderLoading());
      User? user = await service.getLoginUserInfo();
      if (user != null) {
        List<OrderModel> myOrders = await service.getMyOrder(user.uid);
        emit(MyOrderLoaded(myOrders));
      } else {
        emit(MyOrderError());
      }
    });
    on<GetAllOrder>((event, emit) async {
      emit(MyOrderLoading());
      List<OrderModel> orders = await service.getAllOrder();
      emit(MyOrderLoaded(orders));
    });
  }
}
