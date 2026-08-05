import 'package:ecommerce_app3/bloc/cart/cart_bloc.dart';
import 'package:ecommerce_app3/bloc/category/category_bloc.dart';
import 'package:ecommerce_app3/bloc/imageUpload/imageUpload_bloc.dart';
import 'package:ecommerce_app3/bloc/myOrder/my_order_bloc.dart';
import 'package:ecommerce_app3/bloc/product/product_bloc.dart';
import 'package:ecommerce_app3/bloc/wishlist/wishlist_bloc.dart';
import 'package:ecommerce_app3/notification_service.dart';
import 'package:ecommerce_app3/screens/admin_dasboard.dart';
import 'package:ecommerce_app3/screens/home_page.dart';
import 'package:ecommerce_app3/screens/login_screen.dart';
import 'package:ecommerce_app3/screens/navigation_screen.dart';
import 'package:ecommerce_app3/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';
import 'package:ecommerce_app3/screens/signup_screen.dart';
import 'package:ecommerce_app3/screens/forgot_password.dart';
import 'package:ecommerce_app3/screens/login_screen.dart';
// import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  NotificationService.instance.init();

  runApp(const MyApp());
}

class Calculator {
  int add(int a, int b) {
    return a + b;
  }
}

// const adminRoute = '/AdminDasboard';
// final _router = GoRouter(
//   routes: [
//     GoRoute(path: '/', builder: (context, state) => SplashScreen()),
//     GoRoute(
//       path: '/AdminDasboard',
//       builder: (context, state) => const AdminDasboard(),
//     ),
//     GoRoute(
//       path: '/NavigationScreen',
//       builder: (context, state) => const NavigationScreen(),
//     ),
//     GoRoute(
//       path: '/LoginScreen',
//       builder: (context, state) => const LoginScreen(),
//     ),
//     GoRoute(
//       path: '/ExamplePage',
//       builder: (context, state) => const ExamplePage(),
//     ),
//   ],
// );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => ProductBloc()),
        BlocProvider(create: (BuildContext context) => CategoryBloc()),
        BlocProvider(create: (BuildContext context) => ImageuploadBloc()),
        BlocProvider(create: (BuildContext context) => CartBloc()),
        BlocProvider(create: (BuildContext context) => WishlistBloc()),
        BlocProvider(create: (BuildContext context) => MyOrderBloc()),
      ],
      child: MaterialApp(
        //  MaterialApp.router(
        // routerConfig: _router,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: SplashScreen(),
        // home: const LoginScreen(),
      ),
    );
  }
}
