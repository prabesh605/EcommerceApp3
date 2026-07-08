import 'package:ecommerce_app3/screens/forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25),

          child: Column(
            children: [

              const SizedBox(height: 50),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Welcome\nBack!",
                  style: GoogleFonts.poppins(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 50),

              TextField(
                controller: emailController,

                decoration: InputDecoration(
                  hintText: "Username or Email",

                  prefixIcon: const Icon(Icons.person_outline),
                  iconColor: Colors.black,

                  filled: true,
                  fillColor: Colors.grey.shade100,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 18),

              TextField(
                controller: passwordController,

                obscureText: obscureText,

                decoration: InputDecoration(
                  hintText: "Password",

                  prefixIcon: const Icon(Icons.lock_outline),

                  suffixIcon: IconButton(
                    icon: Icon(
                      obscureText
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),

                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                  ),

                  filled: true,
                  fillColor: Colors.grey.shade100,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Align(
                alignment: Alignment.centerRight,

                child: GestureDetector(
                  onTap: () {               /// Forgot Password Screen
                 
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgotPasswordScreen(),
                    ),
                  );

                  
                  },

                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    backgroundColor:const Color.fromARGB(237, 192, 16, 72),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),

                  onPressed: () {           
                    
                    /// Login Function

                    
                  },

                  child: Text(
                    "Login",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 35),

              Row(
                children: [

                  Expanded(child: Divider()),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Continue with",
                      style: GoogleFonts.poppins(),
                    ),
                  ),

                  Expanded(child: Divider()),
                ],
              ),

              const SizedBox(height: 25),

              InkWell(
                onTap: () {              /// Google Login

                  onTap: () async {
                    String? error =
                        await FirebaseService.instance.googleLogin();

                    if (error == null) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const HomeScreen(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(error)),
                      );
                    }

                },

                child: Container(

                  width: 60,
                  height: 60,

                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade300),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.network(
                      "https://developers.google.com/identity/images/g-logo.png",
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 35),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  const Text(
                    "Create new account? ",
                  ),

                  GestureDetector(

                    onTap: () {           
                      
                      /// Signup Screen                    

                    },

                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}