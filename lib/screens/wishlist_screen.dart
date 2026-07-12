import 'package:ecommerce_app3/constants/strings.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Wish list")),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
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
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            products.first.subTitle,
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
                              Text("5"),
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
                            "Quantity: 4",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
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
