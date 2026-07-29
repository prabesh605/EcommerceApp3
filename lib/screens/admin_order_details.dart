import 'package:ecommerce_app3/constants/strings.dart';
import 'package:ecommerce_app3/models/cart_model.dart';
import 'package:ecommerce_app3/models/order_model.dart';
import 'package:ecommerce_app3/services/firebase_service.dart';
import 'package:flutter/material.dart';

class AdminOrderDetails extends StatefulWidget {
  const AdminOrderDetails({super.key, required this.myOrder});
  final OrderModel myOrder;
  @override
  State<AdminOrderDetails> createState() => _AdminOrderDetailsState();
}

class _AdminOrderDetailsState extends State<AdminOrderDetails> {
  FirebaseService service = FirebaseService();
  OrderStatus changeOrderStatus(OrderStatus status) {
    switch (status) {
      case OrderStatus.orderPlaced:
        return OrderStatus.processing;

      case OrderStatus.processing:
        return OrderStatus.shipped;

      case OrderStatus.shipped:
        return OrderStatus.outForDelivery;

      case OrderStatus.outForDelivery:
        return OrderStatus.delivered;

      case OrderStatus.delivered:
        // Already completed
        return OrderStatus.delivered;

      case OrderStatus.cancelled:
        // Cannot move forward from cancelled
        return OrderStatus.cancelled;
    }
  }

  String textName(OrderStatus status) {
    switch (status) {
      case OrderStatus.orderPlaced:
        return "Confirm Order";

      case OrderStatus.processing:
        return "Ship Order";

      case OrderStatus.shipped:
        return "Out for Delivery";

      case OrderStatus.outForDelivery:
        return "Mark as Delivered";

      case OrderStatus.delivered:
        return "Order Delivered";

      case OrderStatus.cancelled:
        return "Order Cancelled";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admin Order Detail")),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                // Text(myOrder.Admin),
                Text("Total Cost:${widget.myOrder.total}"),
                Text("OrderAt: ${widget.myOrder.createdDate}"),
                Text("PaymentDetails:${widget.myOrder.paymentDetail}"),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                onPressed: () async {
                  OrderStatus order = changeOrderStatus(
                    OrderStatus.orderPlaced,
                  );
                  await service.updateStatusOfOrder(widget.myOrder.id, order);
                },
                child: Text(textName(OrderStatus.shipped)),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {},
                child: Text(
                  "Cancel Order",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: widget.myOrder.products.length,
              itemBuilder: (context, index) {
                CartModel product = widget.myOrder.products[index];
                return Container(
                  margin: EdgeInsets.all(12),
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .4,
                        height: MediaQuery.of(context).size.height * .2,
                        child: Image.network(
                          product.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            product.subTitle,
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 10),
                          Text(
                            product.description,
                            maxLines: 4,
                            style: TextStyle(fontSize: 16),
                          ),
                          Text("Quantity: ${product.quantity}"),
                          Text("Cost: ${product.quantity * product.price}"),
                        ],
                      ),
                      //image
                      //text column
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
