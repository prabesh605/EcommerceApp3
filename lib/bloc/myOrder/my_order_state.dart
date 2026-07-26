import 'package:ecommerce_app3/models/order_model.dart';

abstract class MyOrderState {}

class MyOrderInitial extends MyOrderState {}

class MyOrderLoading extends MyOrderState {}

class MyOrderLoaded extends MyOrderState {
  List<OrderModel> myOrders;
  MyOrderLoaded(this.myOrders);
}

class MyOrderError extends MyOrderState {}
