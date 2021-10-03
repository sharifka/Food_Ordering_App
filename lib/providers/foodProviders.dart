import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:food_ordering_app/constants.dart';
import 'package:food_ordering_app/models/models.dart';
import 'package:http/http.dart' as http;

class Foodsprovider extends ChangeNotifier {
  List<FoodsModel> food = [];
  List<CategoryModel> categories = [];
  bool foodloading = true, categoryloading = true;

  Future<void> getFoods() async {
    foodloading = true;
    notifyListeners();
    try {
      http.Response response = await http.post(Uri.parse(kIpaddress), body: {
        'action': 'getFoods',
      });
      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        food = data.map((e) => FoodsModel.fromJson(e)).toList();
        // print(data);
       } else {
        print(response.body[0]);
      }
    } on SocketException {
      print('No Internet Access');
    } catch (e) {
      print(e.toString());
    }
    foodloading = false;
    notifyListeners();
  }

  Future<void> getCategories() async {
    categoryloading = true;
    notifyListeners();
    try {
      http.Response response = await http.post(
        Uri.parse(kIpaddress),
        body: {
          'action': 'getCategories',
        },
      );

      if (response.statusCode == 200) {
        final List xog = jsonDecode(response.body);
        categories = xog.map((e) => CategoryModel.fromJson(e)).toList();
      } else {
        print(response.body);
      }
    } on SocketException {
      print('No Internet Access');
    } catch (e) {
      print(e.toString());
    }
    categoryloading=false;
    notifyListeners();
  }
}
