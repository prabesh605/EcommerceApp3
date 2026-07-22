import 'package:ecommerce_app3/bloc/wishlist/wishlist_bloc.dart';
import 'package:ecommerce_app3/bloc/wishlist/wishlist_event.dart';
import 'package:ecommerce_app3/bloc/wishlist/wishlist_state.dart';
import 'package:ecommerce_app3/constants/strings.dart';
import 'package:ecommerce_app3/models/product_model.dart';
import 'package:ecommerce_app3/models/wishlist_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  void initState() {
    context.read<WishlistBloc>().add(GetAllWishList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Wish list")),
      body: Column(
        children: [
          BlocBuilder<WishlistBloc, WishlistState>(
            builder: (context, state) {
              if (state is LoadingWishList) {
                return Center(child: CircularProgressIndicator());
              } else if (state is ErrorWishList) {
                return Center(child: Text("Error"));
              } else if (state is LoadedWishList) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.wishLists.length,
                    itemBuilder: (BuildContext context, int index) {
                      WishListModel wishlist = state.wishLists[index];
                      return Container(
                        margin: EdgeInsets.all(12),
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .4,
                              height: MediaQuery.of(context).size.height * .2,
                              child: Image.network(
                                wishlist.imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  wishlist.title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  wishlist.subTitle,
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  wishlist.description,
                                  maxLines: 4,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            //image
                            //text column
                          ],
                        ),
                      );
                    },
                  ),
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
