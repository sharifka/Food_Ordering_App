import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_ordering_app/providers/providers.dart';
import 'package:food_ordering_app/screens/login.dart';
import 'package:food_ordering_app/widgets/social_icon_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Signup extends StatefulWidget {
  static const String id = 'Signup';

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool hidepassword = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<SignupProvider>(
      builder: (context, value, _) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 36),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome To',
                        style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.w300,
                            color: Colors.black87),
                      ),
                      Text(
                        'Sign Up',
                        style: GoogleFonts.montserrat(
                            color: Colors.red,
                            fontSize: 30,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 3),
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
                          controller: value.name,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'fullname',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.only(left: 16, right: 16),
                      child: Center(
                        child: TextFormField(
                          controller: value.tell,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              fillColor: Colors.white,
                              filled: true,
                              labelText: 'Phone'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.only(left: 16, right: 16),
                      child: Center(
                        child: TextFormField(
                          controller: value.email,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              fillColor: Colors.white,
                              filled: true,
                              labelText: 'Email'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.only(left: 16, right: 16),
                      child: Center(
                        child: TextFormField(
                          controller: value.user,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              fillColor: Colors.white,
                              filled: true,
                              labelText: 'Username'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
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
                          obscureText: hidepassword,
                          decoration: InputDecoration(
                              suffix: GestureDetector(
                                child: Icon(
                                  hidepassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onTap: () => setState(
                                    () => hidepassword = !hidepassword),
                              ),
                              border: InputBorder.none,
                              fillColor: Colors.white,
                              filled: true,
                              labelText: 'Password'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.only(left: 16, right: 16),
                      child: Center(
                        child: TextFormField(
                          controller: value.address,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              fillColor: Colors.white,
                              filled: true,
                              labelText: 'Address'),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      margin: EdgeInsets.only(left: 16, right: 16),
                      height: 60,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          value.register();
                          value.getClear();
                        },
                        child: Text(
                          'Sign Up',
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
                    'Or Sign Up with',
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
                    ),
                    const SizedBox(width: 10),
                    SocialIconButton(
                        icon: Icon(
                      FontAwesomeIcons.sms,
                      color: Colors.black,
                    )),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, LoginScreen.id),
                      child: Text(
                        'Back To log In',
                        style: GoogleFonts.poppins(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
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
