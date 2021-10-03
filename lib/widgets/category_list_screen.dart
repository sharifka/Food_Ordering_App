import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/providers/cartprovider.dart';
import 'package:food_ordering_app/providers/providers.dart';
import 'package:food_ordering_app/screens/cart_screen.dart';
import 'package:provider/provider.dart';

import 'category_card.dart';

class CategoryListScreen extends StatefulWidget {
  static const String id = 'CategoryListScreen';

  @override
  _CategoryListScreenState createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, value, _) => Scaffold(
        backgroundColor: Color(0xfff5f9ff),
        appBar: AppBar(
          title: Text('Food Categories'),
          backgroundColor: Colors.red,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
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
          builder: (context, value, _) => GridView.builder(
            padding: EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: value.categories.length,
            itemBuilder: (context, index) => CategoryCard(
              category: value.categories[index],
            ),
          ),
        ),
      ),
    );
  }
}
