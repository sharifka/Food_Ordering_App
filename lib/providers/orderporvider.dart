// import 'dart:convert';

// import 'package:flutter/cupertino.dart';
// import 'package:food_ordering_app/constants.dart';
// import 'package:food_ordering_app/models/order.dart';
// import 'package:http/http.dart' as http;

// class OrderProvider extends ChangeNotifier {
//   List<OrderModel> order = [];
//   Future<void> addorder() async {
//     try {
//       http.Response response = await http.post(Uri.parse(kOrder), body: {
//         'action': 'addNewOrder',
//         'customer_id': '',
//         'food_id': '',
//         'amount': '',
//         'date': '',
//         'status': '',
//       });
//       if (response.statusCode == 200) {
//         final List data = jsonDecode(response.body);
//         order = data.map((e) => OrderModel.fromJson(e)).toList();
//       } else {
//         print(response.body[0]);
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//     notifyListeners();
//   }
// }
