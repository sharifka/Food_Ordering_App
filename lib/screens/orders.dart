import 'package:flutter/material.dart';
import 'package:food_ordering_app/constants.dart';
import 'package:food_ordering_app/providers/cartprovider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Orders extends StatefulWidget {
  static const String id = 'Orders';
 
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
   static const String phone ="*712*618953952";
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder:(context,value,_)=> Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          //automaticallyImplyLeading: false,
          title: Text('Oreders'),
          centerTitle: true,
        ),
        body: SafeArea(
          minimum: EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 250,
                child: WebView(
                  javascriptMode: JavascriptMode.unrestricted,
                  initialUrl: kOrderview,
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(left: 30,right: 30),
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    String evc="tel:" + phone.toString()+'*${value.getTotal().toString()}%23' ;
                    launch(evc);
                  },
                  child: Text(
                    'Pay the money',
                    style: GoogleFonts.poppins(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
