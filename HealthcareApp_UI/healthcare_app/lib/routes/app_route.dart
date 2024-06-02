import 'package:flutter/material.dart';
import 'package:healthcare_app/screens/login.dart';
import 'package:healthcare_app/screens/onbording.dart';
import 'package:healthcare_app/screens/signup.dart';
import 'package:healthcare_app/screens/splash_screen.dart';

Widget initialScreen=const SplashScreen();
Map<String,Widget Function(BuildContext)> appRoutes={
  // "/home":(context)=>Home(),
  "/onboard":(context)=>const OnboardScreen(),
  "/signup":(context)=>const SignUp(),
  "/login":(context)=> const Login(),
};