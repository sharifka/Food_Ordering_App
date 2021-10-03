import 'package:flutter/material.dart';
import 'package:food_ordering_app/providers/forgot.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ForgotScreen extends StatefulWidget {
  static const String id = 'ForgotScreen';

  @override
  _ForgotScreenState createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ForgotProvider>(
      builder: (context, value, _) => Scaffold(
        appBar: AppBar(
          title: Text('Forgot'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 46),
                  child: Text(
                    'Fortgot password',
                    style: GoogleFonts.poppins(
                      fontSize: 29,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 80),
            Container(
              height: 60,
              margin: EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: TextFormField(
                  controller: value.txtemail,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Email',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 60),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  value.getPassword();
                  
                },
                child: Text(
                  'Send My Password',
                  style: GoogleFonts.monda(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
