import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_ordering_app/providers/login_provider.dart';
import 'package:food_ordering_app/screens/screens.dart';
import 'package:food_ordering_app/screens/signup.dart';
import 'package:food_ordering_app/widgets/social_icon_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _hidePassword = true;
late FocusNode myFocusNode;
   @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }
  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, value, _) => Scaffold(
        // backgroundColor: Colors.blueGrey[100],
        body: SafeArea(
          // minimum: EdgeInsets.only(top: 100),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 36),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome To',
                        style: GoogleFonts.poppins(
                          color: Colors.black87,
                          fontSize: 24,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        'Login Side',
                        style: GoogleFonts.montserrat(
                          color: Colors.red,
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.only(left: 16, right: 16),
                      child: Center(
                        child: TextFormField(
                          focusNode: myFocusNode,
                          //autofocus: true,
                          controller: value.user,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'Username',
                            // labelStyle: TextStyle(
                            //   color: Theme.of(context).primaryColor,
                            // ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.only(left: 16, right: 16),
                      child: Center(
                        child: TextFormField(
                          controller: value.pass,
                          obscureText: _hidePassword,
                          decoration: InputDecoration(
                            suffix: GestureDetector(
                              child: Icon(
                                _hidePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onTap: () => setState(
                                  () => _hidePassword = !_hidePassword),
                            ),
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            filled: true,
                            labelText: 'Password',
                            // labelStyle: TextStyle(
                            //   color: Theme.of(context).primaryColor,
                            // ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16, right: 16, top: 10),
                      child: TextButton(
                        onPressed: () =>Navigator.pushNamed(context, ForgotScreen.id),
                        child: Text(
                          'Forget Passowrd?',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      margin: EdgeInsets.only(left: 16, right: 16),
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          value.getUsers(context);
                          value.getClear();
                          FocusScope.of(context).requestFocus(myFocusNode);
                        },
                        child: Text(
                          'Log in',
                          style: GoogleFonts.poppins(fontSize: 20),
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
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    'Or Login With',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialIconButton(
                      icon: Icon(
                        FontAwesomeIcons.google,
                        color: Colors.deepOrange,
                      ),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 10),
                    SocialIconButton(
                      icon: Icon(
                        FontAwesomeIcons.facebook,
                        color: Colors.blue,
                      ),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 10),
                    SocialIconButton(
                      icon: Icon(
                        FontAwesomeIcons.sms,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        'Not a member ?',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.popAndPushNamed(context, Signup.id),
                      child: Text(
                        'Join Now',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
