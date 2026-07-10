import 'package:ecommerce_app3/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.product});
  final Product product;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.category),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    widget.product.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                widget.product.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 5),
              Text(
                widget.product.subTitle,
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              SizedBox(height: 5),
              RatingBar.builder(
                allowHalfRating: true,
                ignoreGestures: true,
                initialRating: widget.product.rating,
                itemBuilder: (context, _) =>
                    Icon(Icons.star, color: Colors.amber),

                onRatingUpdate: (value) {},
              ),
              SizedBox(height: 5),
              Text(
                "Price: \$${widget.product.price}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                "Product Details",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                widget.product.description,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.blue,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_cart, color: Colors.white),
                          Text(
                            "Go To Cart",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.green,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.touch_app, color: Colors.white),
                          Text(
                            "Buy Now",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Similar Products",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 350,
                child: ListView.builder(
                  itemCount: products.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductScreen(product: product),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        width: MediaQuery.of(context).size.height * 0.30,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.20,
                              width: MediaQuery.of(context).size.height * 0.30,
                              child: ClipRRect(
                                borderRadius: BorderRadiusGeometry.circular(12),
                                child: Image.network(
                                  product.imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              product.title,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(product.description),
                            Text(
                              "\$${product.price}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            // Text("4.5")
                            RatingBar.builder(
                              initialRating: product.rating,
                              itemBuilder: (context, _) =>
                                  Icon(Icons.star, color: Colors.amber),
                              onRatingUpdate: (value) {},
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
