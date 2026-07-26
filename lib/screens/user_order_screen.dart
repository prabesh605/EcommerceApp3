import 'package:ecommerce_app3/bloc/myOrder/my_order_bloc.dart';
import 'package:ecommerce_app3/bloc/myOrder/my_order_event.dart';
import 'package:ecommerce_app3/bloc/myOrder/my_order_state.dart';
import 'package:ecommerce_app3/models/cart_model.dart';
import 'package:ecommerce_app3/models/order_model.dart';
import 'package:ecommerce_app3/screens/user_order_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserOrderScreen extends StatefulWidget {
  const UserOrderScreen({super.key});

  @override
  State<UserOrderScreen> createState() => _UserOrderScreenState();
}

class _UserOrderScreenState extends State<UserOrderScreen> {
  @override
  void initState() {
    context.read<MyOrderBloc>().add(GetMyOrder());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MyOrderBloc, MyOrderState>(
        builder: (context, state) {
          if (state is MyOrderLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is MyOrderError) {
            return Center(child: Text("Error"));
          } else if (state is MyOrderLoaded) {
            return ListView.builder(
              itemCount: state.myOrders.length,
              itemBuilder: (BuildContext context, int index) {
                OrderModel myOrder = state.myOrders[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            UserOrderDetails(myOrder: myOrder),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(12),
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        // Text(myOrder.user),
                        Text("Total Cost:${myOrder.total}"),
                        Text("OrderAt: ${myOrder.createdDate}"),
                        Text("PaymentDetails:${myOrder.paymentDetail}"),
                        SizedBox(
                          height: 100,
                          child: ListView.builder(
                            itemCount: myOrder.products.length,
                            itemBuilder: (context, index) {
                              CartModel product = myOrder.products[index];
                              return ListTile(
                                leading: Icon(Icons.shop),
                                title: Text(product.title),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
