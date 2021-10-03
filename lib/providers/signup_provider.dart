import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_ordering_app/constants.dart';
import 'package:http/http.dart' as http;

class SignupProvider extends ChangeNotifier {
  TextEditingController name = TextEditingController();
  TextEditingController tell = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController address = TextEditingController();

  Future register() async {
    http.Response response =
        await http.post(Uri.parse(kLogin_and_signup), body: {
      'action': 'addnewcustomer',
      'fullname': name.text,
      'phone': tell.text,
      'email': email.text,
      'username': user.text,
      'password': pass.text,
      'address': address.text,
    });
    var data = jsonDecode(response.body);
    print(data);
    if (data['status'] == false) {
      Fluttertoast.showToast(
        msg: "this user all ready exist",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else {
      Fluttertoast.showToast(
          msg: "inserted success",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    notifyListeners();
  }

  getClear() {
    name.clear();
    tell.clear();
    email.clear();
    user.clear();
    pass.clear();
    address.clear();
    //notifyListeners();
  }
}
