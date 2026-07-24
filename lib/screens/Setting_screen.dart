import 'package:ecommerce_app3/screens/user_order_screen.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Setting")),
      body: Column(
        children: [
          Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserOrderScreen()),
                );
              },
              leading: Icon(Icons.production_quantity_limits),
              title: Text("My Order"),
            ),
          ),
        ],
      ),
    );
  }
}
