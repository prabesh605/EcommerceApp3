import 'package:ecommerce_app3/models/category_model.dart';
import 'package:ecommerce_app3/models/product_model.dart';
import 'package:ecommerce_app3/screens/login_screen.dart';
import 'package:ecommerce_app3/screens/product_screen.dart';
import 'package:ecommerce_app3/screens/user_screen.dart';
import 'package:ecommerce_app3/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseService firebase = FirebaseService();
  List<Category> categories = [];
  List<Product> products = [];
  @override
  void initState() {
    getCategories();
    getProducts();
    super.initState();
  }

  Future<void> getCategories() async {
    categories = await firebase.getCategory();
    setState(() {});
  }

  Future<void> getProducts() async {
    products = await firebase.getProduct();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('assets/logo.png', height: 40),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserScreen()),
              );
            },
            child: CircleAvatar(backgroundColor: Colors.red, radius: 25),
          ),
          SizedBox(width: 5),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(leading: Icon(Icons.home), title: Text("Home")),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () async {
                await firebase.logout();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
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
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    Category category = categories[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(category.imageUrl),
                            radius: 35,
                          ),
                          Text(category.name),
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
              DealWidget(
                color: Colors.blue,
                name: "Deal of the Day",
                iconData: Icons.alarm,
                subName: '22h 55m 20s remaining',
              ),
              //products horizontal scrolling
              SizedBox(height: 20),
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
              DealWidget(
                color: Colors.red.shade400,
                name: 'Trending Products',
                iconData: Icons.calendar_month,
                subName: 'Last Date 29/02/22',
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 200,
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

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.10,
                              width: MediaQuery.of(context).size.height * 0.15,
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

                            Text(
                              "\$200",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      child: Image.asset('assets/image.jpg'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "New Arrivals",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                "Summer' 25 Collections",
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.red,
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
                        ],
                      ),
                    ),
                  ],
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

class DealWidget extends StatelessWidget {
  const DealWidget({
    super.key,
    required this.color,
    required this.name,
    required this.iconData,
    required this.subName,
  });
  final Color color;
  final String name;
  final IconData iconData;
  final String subName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyle(color: Colors.white)),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(iconData, color: Colors.white),
                  Text(subName, style: TextStyle(color: Colors.white)),
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
                Text('View all', style: TextStyle(color: Colors.white)),
                Icon(Icons.arrow_forward, color: Colors.white),
              ],
            ),
          ),
          // Column(children: [

          // ]),
        ],
      ),
    );
  }
}
