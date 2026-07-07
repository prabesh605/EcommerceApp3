import 'package:flutter/material.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});
  
  TextEditingController? get emailController => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            SizedBox(height:50),
            // Title
            const Text(
              "Forgot\npassword?",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
               
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: emailController,

              decoration: InputDecoration(
                label: Text("Enter your email address",
                 style: TextStyle(fontSize: 13),),
                filled: true,
                fillColor: const Color(0xFFF3F3F3),
                
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: const Color(0xFFA8A8A9),
                  ),
                ),
  
                prefixIcon: const Icon(Icons.email),
                 contentPadding: EdgeInsets.symmetric(
                  vertical: 22,
                  
              ),
            ),
            
         ),
         SizedBox(height: 20),
         const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
          
              children: [
                Text(
                  "* ",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                  ),
                ),

                Expanded(
                  child: Text(
                    "We will send you a message to set or reset\nyour new password.",
                    style: TextStyle(fontSize: 13,
                    color: Color(0xFF676767)
                    ),
                    
                  ),
                ), ],
  
        ),
        SizedBox(height: 35),
            ElevatedButton(
              onPressed: () {
                // Handle reset password logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:const Color(0xFFF83758),
                padding: const EdgeInsets.symmetric(vertical: 25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Center(
                child: Text(
                  "Submit",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      
      

    )
  );
}}
