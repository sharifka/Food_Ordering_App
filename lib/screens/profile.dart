import 'package:flutter/material.dart';
import 'package:food_ordering_app/screens/screens.dart';
import 'package:food_ordering_app/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_settings/open_settings.dart';
import 'package:url_launcher/url_launcher.dart';


class ProfileScreen extends StatelessWidget {
  static const String id = 'ProfileScreen';
  static const url = "JtechTechnolgySolution.so";
  static const email = "Sharifka120@gmail.com";
  static const phone = "+252618953952";
  static const location = "Mogdishu, Somali";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 60),
        child: ListView(
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/FAT.JPG'),
                ),
                Text(
                  'Abdifatah Sharif',
                  style: GoogleFonts.prata(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Flutter Developer',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.blueGrey[200],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 200,
                  child: Divider(
                    color: Colors.white,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Personal Details',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Colors.blueGrey[100],
                        ),
                      ),
                    ),
                  ],
                ),
                InfoCard(
                    text: phone,
                    icon: Icons.phone,
                    onPressed: () {
                      String telphone = "tel:" + phone.toString();
                      launch(telphone);
                    }
                    // showDialog(
                    //   context: context,
                    //   builder: (_) => AlertDialog(
                    //     actions: [
                    //       TextButton(onPressed: () {}, child: Text('Yes')),
                    //       TextButton(onPressed: () {}, child: Text('No')),
                    //     ],
                    //     title: Text('Call Dial'),
                    //     content: Text(
                    //       'Are sure you want to call this number $phone',
                    //     ),
                    //   ),
                    ),
                InfoCard(
                  text: url,
                  icon: Icons.web,
                  onPressed: () => Navigator.pushNamed(context, Test.id),
                ),
                InfoCard(
                    text: location,
                    icon: Icons.location_city,
                    onPressed: () {}),
                InfoCard(
                    text: email,
                    icon: Icons.email,
                    onPressed: () {
                      String gamil = "mailto:" + email;
                      launch(gamil);
                    }),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Settings',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Colors.blueGrey[100],
                        ),
                      ),
                    ),
                  ],
                ),
                InfoCard(
                    text: 'Settings',
                    icon: Icons.settings,
                    onPressed: () {
                      OpenSettings.openMainSetting();
                    }),
                InfoCard(text: 'About us', icon: Icons.info, onPressed: () {
                Navigator.pushNamed(context, AboutUs.id);
                }),
                InfoCard(
                    text: 'Log Out',
                    icon: Icons.logout,
                    onPressed: () {
                      Navigator.pushNamed(context, LoginScreen.id);
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
