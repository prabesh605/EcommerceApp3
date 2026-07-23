import 'package:ecommerce_app3/constants/strings.dart';
import 'package:ecommerce_app3/models/cart_model.dart';
import 'package:ecommerce_app3/models/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OrderModel {
  final String id;
  final List<CartModel> products;
  final double total;
  final DateTime createdDate;
  final String user;
  final String address;
  final String paymentDetail;
  OrderModel({
    required this.id,
    required this.products,
    required this.total,
    required this.createdDate,
    required this.user,
    required this.address,
    required this.paymentDetail,
  });
  factory OrderModel.fromJson(Map<String, dynamic> json, String id) {
    return OrderModel(
      id: id,
      products: (json['products'] as List)
          .map(
            (products) => CartModel.fromJson(
              json['products'] as Map<String, dynamic>,
              'id',
            ),
          )
          .toList(),
      total: json['total'],
      createdDate: json['createdDate'],
      user: json['user'],
      address: json['address'],
      paymentDetail: json['paymentDetail'],
    );
  }
  Map<String, dynamic> toJson() => {
    'products': products.map((product) => product.toJson()).toList(),
    'total': total,
    'createdDate': createdDate,
    'user': user,
    'address': address,
    'paymentDetail': paymentDetail,
  };
}
// products.map((pro) => pro.toJson()).toList(),