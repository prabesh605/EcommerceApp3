import 'package:ecommerce_app3/bloc/user/user_bloc.dart';
import 'package:ecommerce_app3/bloc/user/user_event.dart';
import 'package:ecommerce_app3/bloc/user/user_state.dart';
import 'package:ecommerce_app3/models/user_model.dart';
import 'package:ecommerce_app3/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  // var data = [];
  // UserModel data = [];

  // FirebaseService firebase = FirebaseService();
  // UserModel? userData;
  // Future<void> getUserInfo() async {
  //   User? user = await firebase.getLoginUserInfo();
  //   if (user != null) {
  //     userData = await firebase.getCurrentUserData(user.uid);
  //   }
  // }

  @override
  void initState() {
    context.read<UserBloc>().add(GetUserDetail());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var center = Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(radius: 50, backgroundColor: Colors.red),
              ),
              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UserLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is UserLoaded) {
                    final user = state.data;
                    return Column(
                      children: [
                        Card(
                          child: ListTile(
                            leading: const Icon(Icons.person),
                            title: Text(user.userName ?? "Unknown"),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: const Icon(Icons.email),
                            title: Text(user.email ?? ""),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: const Icon(Icons.person),
                            title: Text(user.userGroup ?? "unknown"),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Additional Info",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Card(
                          child: ListTile(
                            leading: Icon(Icons.flag),
                            title: Text("Nepal"),
                          ),
                        ),
                      ],
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              // Card(
              //   child: ListTile(
              //     leading: Icon(Icons.person),
              //     title: Text(data.),
              //   ),
              // ),
              // Card(
              //   child: ListTile(
              //     leading: Icon(Icons.email),
              //     title: Text(data?.email ?? ""),
              //   ),
              // ),
              // Card(
              //   child: ListTile(
              //     leading: Icon(Icons.person),
              //     title: Text(userData?.userGroup ?? "unknown"),
              //   ),
              // ),
              // SizedBox(height: 20),
              // Text(
              //   "Additional Info",
              //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              // ),
              // SizedBox(height: 10),
              // Card(
              //   child: ListTile(
              //     leading: Icon(Icons.flag),
              //     title: Text("Nepal"),
              //   ),
              // ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.place),
                  title: Text("Kathmandu"),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.place),
                  title: Text("Koteswor"),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Card Detail",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 10),
              Card(
                child: ListTile(
                  leading: Icon(Icons.atm),
                  title: Text("8839489384983483898"),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.money),
                  title: Text("Everest Bank"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(title: Text("User Profile")),
      body: center,
    );
  }
}
