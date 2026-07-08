import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //search
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
                    "All Featured",
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
              //category
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    Product product = products[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(product.imageUrl),
                            radius: 35,
                          ),
                          Text(product.category),
                        ],
                      ),
                    );
                    // return CircleAvatar(
                    //   radius: 80,
                    //   backgroundImage: NetworkImage(product.imageUrl),
                    // );
                  },
                ),
              ),
              //50% off offer
              Image.asset('assets/banner.png', width: double.infinity),
              //deal of the day -view all
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.blue,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Deal of the Day",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.alarm, color: Colors.white),
                            Text(
                              '22h 55m 20s remaining',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'View all',
                            style: TextStyle(color: Colors.white),
                          ),
                          Icon(Icons.arrow_forward, color: Colors.white),
                        ],
                      ),
                    ),
                    // Column(children: [

                    // ]),
                  ],
                ),
              ),
              //products horizontal scrolling
              SizedBox(height: 20),
              SizedBox(
                height: 800,
                child: ListView.builder(
                  itemCount: products.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return Container(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.20,
                            width: MediaQuery.of(context).size.height * 0.30,
                            child: Image.network(
                              product.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(product.name),
                          Text('abca acacac aada adfsdjfkdkj\n kjkfdjkfj kjkj'),
                          Text("\$200"),
                          
                        ],
                      ),
                    );
                  },
                ),
              ),
              //special offer
              //ads
              //trending products
              //product horizontall scolling
              //ads view all
              //ads sponsor
            ],
          ),
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final String category;
  final String imageUrl;

  Product({required this.name, required this.category, required this.imageUrl});
}

final List<Product> products = [
  Product(
    name: "Matte Lipstick",
    category: "Beauty",
    imageUrl:
        "https://images.unsplash.com/photo-1596462502278-27bfdc403348?w=500",
  ),
  Product(
    name: "Face Serum",
    category: "Beauty",
    imageUrl:
        "https://images.unsplash.com/photo-1620916566398-39f1143ab7be?w=500",
  ),
  Product(
    name: "Perfume",
    category: "Beauty",
    imageUrl:
        "https://images.unsplash.com/photo-1541643600914-78b084683601?w=500",
  ),
  Product(
    name: "Men's Jacket",
    category: "Fashion",
    imageUrl:
        "https://images.unsplash.com/photo-1521572267360-ee0c2909d518?w=500",
  ),
  Product(
    name: "Women's Dress",
    category: "Fashion",
    imageUrl:
        "https://images.unsplash.com/photo-1496747611176-843222e1e57c?w=500",
  ),
  Product(
    name: "Sneakers",
    category: "Fashion",
    imageUrl: "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500",
  ),
  Product(
    name: "Kids T-Shirt",
    category: "Kids",
    imageUrl:
        "https://images.unsplash.com/photo-1519238263530-99bdd11df2ea?w=500",
  ),

  Product(
    name: "Kids Shoes",
    category: "Kids",
    imageUrl:
        "https://images.unsplash.com/photo-1514989940723-e8e51635b782?w=500",
  ),
];
