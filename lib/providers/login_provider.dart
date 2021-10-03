import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_ordering_app/constants.dart';
import 'package:food_ordering_app/screens/orders.dart';
import 'package:http/http.dart' as http;

class LoginProvider extends ChangeNotifier {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  Future<void> getUsers(BuildContext context) async {
    try {
      http.Response response =
          await http.post(Uri.parse(kLogin_and_signup), body: {
        'action': 'login',
        'username': user.text,
        'password': pass.text,
      });
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        //print(data);
        if (data['status'] == false) {
          Fluttertoast.showToast(
            msg: 'Invalid Username or Password',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
            
          );
        } else {
          // Fluttertoast.showToast(
          //   msg: 'correct user and pass',
          //   toastLength: Toast.LENGTH_SHORT,
          //   gravity: ToastGravity.CENTER,
          //   timeInSecForIosWeb: 1,
          //   backgroundColor: Colors.green,
          //   textColor: Colors.white,
          //   fontSize: 16,
          //);
          Navigator.pushNamed(context, Orders.id);
        }
      }
    } on SocketException {
      print('No Internet Access');
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  getClear() {
    user.clear();
    pass.clear();
  }
}
