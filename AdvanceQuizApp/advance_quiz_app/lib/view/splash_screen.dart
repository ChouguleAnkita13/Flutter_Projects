import 'package:advance_quiz_app/view/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomeScreen()));
          },
          child: SizedBox(
            width: double.infinity,
            child: Image.asset("assets/images/splash.png",fit: BoxFit.cover)),
        ),
      
    );
  }
}
