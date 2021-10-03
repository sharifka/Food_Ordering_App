import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';

class ForgotProvider extends ChangeNotifier {
  TextEditingController txtemail = TextEditingController();
  Future<void> getPassword() async {
    try {
      http.Response response = await http.post(
        Uri.parse(kForgot),
        body: {
          'action': 'getPassword',
          'email': txtemail.text,
        },
      );
      var data = jsonDecode(response.body);
      if (data['status'] == true) {
        String sub =
            "?subject=ForgotPassword&body= This is Your Password: ${data['message'].toString()}";
        String gmail = "mailto:" + txtemail.text.toString() + sub;
        launch(gmail);
        // Fluttertoast.showToast(
        //     msg: data['message'],
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: Colors.green,
        //     textColor: Colors.white);
      }
      //  else {
      //   Fluttertoast.showToast(
      //     msg: 'incorrect gmail',
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.green,
      //     textColor: Colors.white,
      //   );
      // }
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }
}
