import 'package:flutter/material.dart';
import 'package:jewellery_app/screens/landingpage.dart';
import 'package:jewellery_app/screens/loginpage.dart';
import 'package:jewellery_app/screens/signup_page.dart';
import 'package:jewellery_app/screens/home_screen.dart';
import 'package:jewellery_app/screens/wishlist.dart';

Widget initialScreen = const LandingPage();
Map<String, Widget Function(BuildContext)> myroutes = {
  "/homescreen": (context) => const HomeScreen(),
  "/wishList": (context) => const WishList(),
  "/login": (context) => const LoginPage(),
  "/signUp": (context) => const SignUp(),
};
