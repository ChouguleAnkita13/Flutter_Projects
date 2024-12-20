import 'package:expense_manager_app/view/category_screen.dart';
import 'package:expense_manager_app/view/graph_screen.dart';
import 'package:expense_manager_app/view/home_screen.dart';
import 'package:expense_manager_app/view/login_screen.dart';
import 'package:expense_manager_app/view/register_screen.dart';
import 'package:expense_manager_app/view/splash_screen.dart';
import 'package:expense_manager_app/view/trash_screen.dart';
import 'package:flutter/material.dart';

Widget initialScreen = const SplashScreen();
Map<String, Widget Function(BuildContext)> appRoutes = {
  "/loginScreen": (context) {
    return const Login();
  },
  "/registerScreen": (context) {
    return const RegisterScreen();
  },
  "/homeScreen": (context) {
    return const HomeScreen();
  },
  "/graphScreen": (context) {
    return const GraphScreen();
  },
  "/categoryScreen": (context) {
    return const CategoryScreen();
  },
  "/trashScreen": (context) {
    return const TrashScreen();
  }
};
