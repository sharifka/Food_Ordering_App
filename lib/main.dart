import 'package:flutter/material.dart';
import 'package:food_ordering_app/providers/cartprovider.dart';
import 'package:food_ordering_app/providers/forgot.dart';
import 'package:food_ordering_app/providers/providers.dart';
import 'package:food_ordering_app/screens/BottomNavigation.dart';
import 'package:food_ordering_app/screens/cart_screen.dart';
import 'package:food_ordering_app/screens/orders.dart';
import 'package:food_ordering_app/screens/screens.dart';
import 'package:food_ordering_app/widgets/category_list_screen.dart';
import 'package:provider/provider.dart';

import 'screens/test.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Foodsprovider()),
        ChangeNotifierProvider.value(value: CartProvider()),
        ChangeNotifierProvider.value(value: LoginProvider()),
        ChangeNotifierProvider.value(value: SignupProvider()),
        ChangeNotifierProvider.value(value: ForgotProvider()),
      ],
      child: FoodOrderingApp(),
    ),
  );
}

class FoodOrderingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Ordering',
      initialRoute: SplashScreen().toString(),
      theme: ThemeData(
        primaryColor: Colors.red,
        scaffoldBackgroundColor: Color(0xfff5f9ff),
      ),
      routes: {
        ProfileScreen.id: (_) => ProfileScreen(),
        // DetailsScreen.id: (_) => DetailsScreen(),
        SplashScreen.id: (_) => SplashScreen(),
        LoginScreen.id: (_) => LoginScreen(),
        Signup.id: (_) => Signup(),
        HomScreen.id: (_) => HomScreen(),
        MainPage.id: (_) => MainPage(),
        CartScreen.id: (_) => CartScreen(),
        CategoryListScreen.id: (_) => CategoryListScreen(),
        Test.id: (_) => Test(),
        AboutUs.id: (_) => AboutUs(),
        Orders.id:(_)=>Orders(),
        ForgotScreen.id:(_)=>ForgotScreen(),
      },
    );
  }
}
