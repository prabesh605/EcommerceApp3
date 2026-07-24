import 'package:ecommerce_app3/screens/add_category_screen.dart';
import 'package:ecommerce_app3/screens/add_product_screen.dart';
import 'package:ecommerce_app3/screens/login_screen.dart';
import 'package:ecommerce_app3/services/firebase_service.dart';
import 'package:flutter/material.dart';

class AdminDasboard extends StatefulWidget {
  const AdminDasboard({super.key});

  @override
  State<AdminDasboard> createState() => _AdminDasboardState();
}

class _AdminDasboardState extends State<AdminDasboard> {
  FirebaseService service = FirebaseService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Admin"),
        actions: [
          IconButton(
            onPressed: () async {
              await service.logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddCategoryScreen(),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "Add Category",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 6),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddProductScreen(),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "Add Product",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text("data"),
          ],
        ),
      ),
    );
  }
}
