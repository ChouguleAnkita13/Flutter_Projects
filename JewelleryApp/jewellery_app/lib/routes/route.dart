import 'package:flutter/material.dart';
import 'package:jewellery_app/screens/addtocart.dart';
import 'package:jewellery_app/screens/categories.dart';
import 'package:jewellery_app/screens/homepage.dart';
import 'package:jewellery_app/screens/landingpage.dart';
import 'package:jewellery_app/screens/loginpage.dart';
import 'package:jewellery_app/screens/profilepage.dart';
import 'package:jewellery_app/screens/signup_page.dart';
import 'package:jewellery_app/screens/wishlist.dart';
import 'package:jewellery_app/screens/your_order.dart';

Widget initialScreen = const LandingPage();
Map<String, Widget Function(BuildContext)> myroutes = {
  "/home": (context) => const HomePage(),
  "/categories": (context) => const Categories(),
  "/yourOrder": (context) => const YourOrder(),
  "/addToCart": (context) => const AddToCart(),
  "/profile": (context) => const ProfilePage(),
  "/wishList": (context) => const WishList(),
  "/login": (context) => const LoginPage(),
  "/signUp": (context) => const SignUp(),


  
};
