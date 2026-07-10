import 'package:ecommerce_app3/constants/strings.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Cart")),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .4,
                        height: MediaQuery.of(context).size.height * .2,
                        child: Image.network(
                          products.first.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            products.first.title,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(products.first.subTitle),
                          Text("Quantity: 4"),
                        ],
                      ),
                      //image
                      //text column
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
