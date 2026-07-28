import 'package:ecommerce_app3/constants/strings.dart';
import 'package:ecommerce_app3/models/cart_model.dart';
import 'package:ecommerce_app3/models/order_model.dart';
import 'package:flutter/material.dart';

class UserOrderDetails extends StatefulWidget {
  const UserOrderDetails({super.key, required this.myOrder});
  final OrderModel myOrder;
  @override
  State<UserOrderDetails> createState() => _UserOrderDetailsState();
}

class _UserOrderDetailsState extends State<UserOrderDetails> {
  int orderPosition(OrderStatus status) {
    switch (status) {
      case OrderStatus.orderPlaced:
        return 0;

      case OrderStatus.processing:
        return 1;

      case OrderStatus.shipped:
        return 2;

      case OrderStatus.outForDelivery:
        return 3;

      case OrderStatus.delivered:
        // Already completed
        return 4;

      case OrderStatus.cancelled:
        // Cannot move forward from cancelled
        return 5;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Order Detail")),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                // Text(myOrder.user),
                Text("Total Cost:${widget.myOrder.total}"),
                Text("OrderAt: ${widget.myOrder.createdDate}"),
                Text("PaymentDetails:${widget.myOrder.paymentDetail}"),
              ],
            ),
          ),
          SizedBox(height: 20),
          Stepper(
            currentStep: orderPosition(widget.myOrder.status),

            steps: OrderStatus.values
                .map(
                  (status) => Step(
                    title: Text(status.name),
                    content: Text(status.name),
                  ),
                )
                .toList(),
          ),
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
