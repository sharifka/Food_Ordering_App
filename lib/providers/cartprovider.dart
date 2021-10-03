import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_ordering_app/constants.dart';
import 'package:food_ordering_app/models/foods.dart';
import 'package:food_ordering_app/screens/screens.dart';
import 'package:http/http.dart' as http;

class CartProvider extends ChangeNotifier {
  final List<FoodsModel> items = [];

  // List order;
  void addTocart(FoodsModel item) {
    if (!items.contains(item)) {
      items.add(item);
      notifyListeners();
    }
  }

  void removeTocart(FoodsModel item) {
    if (items.contains(item)) {
      items.remove(item);
      notifyListeners();
    }
  }

  bool isInCart(FoodsModel food) => items.contains(food);
  void updatecounter(items) {
    items.increments();
    // calculateTotal();
    notifyListeners();
  }

  void reupdatecounter(FoodsModel task) {
    task.decrement();
    // calculateTotal();
    notifyListeners();
  }

  double totalCartValue = 0;
  double getTotal() {
    totalCartValue = 0;
    items.forEach((f) {
      totalCartValue += f.price * f.quantity;
      f.total = totalCartValue;
    });
    return totalCartValue;
  }

  // Make Order
  Future<void> addorder(FoodsModel food,BuildContext context) async {
    try {
      http.Response response = await http.post(Uri.parse(kOrder), body: {
        'action': 'addNewOrder',
        'customer_id': 'CUSR009',
        'food_id': food.id,
        'amount': food.total.toString(),
        'date': DateTime.now().toString(),
        'status': 'pending',
      });

      // print(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        //order = data.map((e) => OrderModel.fromJson(e)).toList();
        print(data);
        if (data['status'] == true) {
          Fluttertoast.showToast(
            msg: 'successfully ordered',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16,
          );
            Navigator.pushNamed(context, LoginScreen.id);
        }
        // else if(data['status']==false){
        //   Fluttertoast.showToast(msg: 'add to the cart to make order',
        //   toastLength: Toast.LENGTH_SHORT,
        //   gravity: ToastGravity.CENTER,
        //   timeInSecForIosWeb: 1,
        //   backgroundColor: Colors.red,
        //   textColor: Colors.white,
        //   fontSize: 16,
        //   );
        // }
      } else {
        print(response.body);
      }
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }
}
