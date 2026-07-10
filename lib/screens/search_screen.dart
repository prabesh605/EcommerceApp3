import 'package:ecommerce_app3/constants/strings.dart';
import 'package:ecommerce_app3/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('assets/logo.png', height: 40),
        actions: [
          CircleAvatar(backgroundColor: Colors.red, radius: 25),
          SizedBox(width: 5),
        ],
      ),
      drawer: Drawer(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.mic),
                hint: Text('Search any Product'),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            //all feature sort/ filter
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "52,082+ items",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),

                      child: Row(
                        children: [
                          Text("Sort"),
                          SizedBox(width: 10),
                          Icon(Icons.sort),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),

                      child: Row(
                        children: [
                          Text("Filter"),
                          SizedBox(width: 10),
                          Icon(Icons.filter_b_and_w_sharp),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 10.0, // Horizontal space between items
                  mainAxisSpacing: 10.0, // Vertical space between items
                  childAspectRatio: 0.6, // Width-to-height ratio of cells
                ),
                itemCount: products.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductScreen(product: product),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(offset: Offset(0, 1), blurRadius: 0.1),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(12),
                            child: SizedBox(
                              height: 150,
                              width: MediaQuery.of(context).size.width * 0.4,
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
                          Text(
                            product.description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                          Text(
                            "\$${product.price}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          // Text("4.5")
                          RatingBar.builder(
                            itemSize: 20,
                            ignoreGestures: true,
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
          ],
        ),
      ),
    );
  }
}
