import 'package:ecommerce_app3/screens/login_screen.dart';
import 'package:ecommerce_app3/screens/navigation_screen.dart';
import 'package:ecommerce_app3/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => NavigationScreen()),
      );
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
