import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/providers/cartprovider.dart';
import 'package:food_ordering_app/providers/providers.dart';
import 'package:food_ordering_app/screens/cart_screen.dart';
import 'package:food_ordering_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class FoodListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, value, _) => Scaffold(
        backgroundColor: Color(0xfff5f9ff),
        appBar: AppBar(
          title: Text('Foods'),
          backgroundColor: Colors.red,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
            IconButton(
              onPressed: () => Navigator.pushNamed(context, CartScreen.id),
              icon: Badge(
                badgeContent: Text(
                  value.items.length.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                badgeColor: Colors.blue,
                child: Icon(Icons.shopping_cart),
              ),
            ),
          ],
        ),
        body: Consumer<Foodsprovider>(
          builder: (context, value, _) => ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: value.food.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: FoodListTile(
                foodsModel: value.food[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
