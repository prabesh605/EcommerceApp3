import 'package:ecommerce_app3/models/order_model.dart';
import 'package:ecommerce_app3/screens/add_category_screen.dart';
import 'package:ecommerce_app3/screens/add_product_screen.dart';
import 'package:ecommerce_app3/screens/admin_order_category_screen.dart';
import 'package:ecommerce_app3/screens/admin_order_screen.dart';
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
  List<OrderModel>? cancelData;
  List<OrderModel>? orderPlacedData;
  List<OrderModel>? processingData;
  List<OrderModel>? completedData;
  List<OrderModel>? todaysData;
  Future<void> getOrderData() async {
    cancelData = await service.getAllCancelData();
    orderPlacedData = await service.getOrderPlacedData();
    processingData = await service.getProessingData();
    completedData = await service.getAllCompleteData();
    todaysData = await service.getTodayTotalOrder();
    setState(() {});
  }

  @override
  void initState() {
    getOrderData();
    super.initState();
  }

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
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminOrderScreen()),
                );
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text("Orders", style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdminOrderCategoryScreen(
                          orders: orderPlacedData ?? [],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "Active Orders",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text("${orderPlacedData?.length ?? 0}"),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AdminOrderCategoryScreen(orders: todaysData ?? []),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "Todays Orders",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text("${todaysData?.length ?? 0}"),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdminOrderCategoryScreen(
                          orders: processingData ?? [],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "Processing ",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text("${processingData?.length ?? 0}"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AdminOrderCategoryScreen(orders: cancelData ?? []),
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
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "cancel Orders",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text("${cancelData?.length ?? 0}"),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdminOrderCategoryScreen(
                          orders: completedData ?? [],
                        ),
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
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "Compelete Orders",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text("${completedData?.length ?? 0}"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
