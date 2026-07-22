import 'package:ecommerce_app3/bloc/cart/cart_bloc.dart';
import 'package:ecommerce_app3/bloc/cart/cart_state.dart';
import 'package:ecommerce_app3/constants/strings.dart';
import 'package:ecommerce_app3/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is CartLoading) {
              } else if (state is CartError) {
              } else if (state is CartLoaded) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.carts.length,
                    itemBuilder: (BuildContext context, int index) {
                      CartModel cart = state.carts[index];
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
                                cart.imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cart.title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  cart.subTitle,
                                  style: TextStyle(fontSize: 16),
                                ),

                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.add),
                                      style: IconButton.styleFrom(
                                        backgroundColor: Colors.grey,
                                        shape: CircleBorder(),
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Text("${cart.quantity}"),
                                    SizedBox(width: 4),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.remove),
                                      style: IconButton.styleFrom(
                                        backgroundColor: Colors.grey,
                                        shape: CircleBorder(),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "Quantity: ${cart.quantity}",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            //image
                            //text column
                          ],
                        ),
                      );
                    },
                  ),
                );
              }
              return Container();
            },
          ),

          // Container(
          //   margin: EdgeInsets.all(6),
          //   padding: EdgeInsets.all(6),
          //   decoration: BoxDecoration(
          //     border: Border.all(),
          //     borderRadius: BorderRadius.circular(12),
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text(
          //         "Total :Rs 10000",
          //         style: TextStyle(fontWeight: FontWeight.bold),
          //       ),
          //       OutlinedButton(
          //         style: OutlinedButton.styleFrom(backgroundColor: Colors.red),
          //         onPressed: () {},
          //         child: Text(
          //           "Order Now",
          //           style: TextStyle(color: Colors.white),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
