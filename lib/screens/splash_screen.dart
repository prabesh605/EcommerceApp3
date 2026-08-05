import 'package:ecommerce_app3/models/user_model.dart';
import 'package:ecommerce_app3/screens/admin_dasboard.dart';
import 'package:ecommerce_app3/screens/login_screen.dart';
import 'package:ecommerce_app3/screens/navigation_screen.dart';
import 'package:ecommerce_app3/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseService firebaseService = FirebaseService();
  Future<void> getCurrentUser() async {
    User? user = await firebaseService.getLoginUserInfo();
    await Future.delayed(Duration(seconds: 2));
    // context.go('/ExamplePage');
    if (user != null) {
      UserModel userData = await firebaseService.getCurrentUserData(user.uid);
      if (userData.userGroup == 'admin') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AdminDasboard()),
        );
        // context.go('/AdminDasboard');
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => NavigationScreen()),
        );
        // context.go('/NavigationScreen');
      }

      //if usergroup = admin return AdminPanel else return NavigationScreen
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(child: Image.asset('assets/logo.png')),
    );
  }
}

// class ExamplePage extends StatefulWidget {
//   const ExamplePage({super.key});

//   @override
//   State<ExamplePage> createState() => _ExamplePageState();
// }

// class _ExamplePageState extends State<ExamplePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Center(child: Text("Example Page")));
//   }
// }
