import 'package:flutter/material.dart';
import 'package:jewellery_app/view/screens/landingpage.dart';
import 'package:jewellery_app/view/screens/loginpage.dart';
import 'package:jewellery_app/view/screens/signup_page.dart';
import 'package:jewellery_app/view/screens/home_screen.dart';
import 'package:jewellery_app/view/screens/wishlist.dart';

Widget initialScreen = const LandingPage();
Map<String, Widget Function(BuildContext)> myroutes = {
  "/homescreen": (context) => const HomeScreen(),
  "/wishList": (context) => const WishList(),
  "/login": (context) => const LoginPage(),
  "/signUp": (context) => const SignUp(),
};
