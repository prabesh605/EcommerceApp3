import 'package:ecommerce_app3/models/cart_model.dart';
import 'package:ecommerce_app3/models/order_model.dart';
import 'package:ecommerce_app3/screens/admin_order_details.dart';
import 'package:flutter/material.dart';

class AdminOrderCategoryScreen extends StatefulWidget {
  const AdminOrderCategoryScreen({super.key, required this.orders});
  final List<OrderModel> orders;

  @override
  State<AdminOrderCategoryScreen> createState() =>
      _AdminOrderCategoryScreenState();
}

class _AdminOrderCategoryScreenState extends State<AdminOrderCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admin Order Screen")),
      body: ListView.builder(
        itemCount: widget.orders.length,
        itemBuilder: (BuildContext context, int index) {
          OrderModel myOrder = widget.orders[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AdminOrderDetails(myOrder: myOrder),
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
                  Align(
                    alignment: Alignment.centerRight,
                    child: Card(
                      color: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          myOrder.status.name,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
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
      ),
    );
  }
}
