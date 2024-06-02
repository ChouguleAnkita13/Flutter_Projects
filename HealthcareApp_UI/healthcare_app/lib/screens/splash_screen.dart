import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    // Future.delayed(const Duration(seconds: 5), () {
    //   Navigator.of(context).pushNamed("/onboard");
    // });
    return Scaffold(
        body: GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed("/onboard");
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/images/splash1.png",
            fit: BoxFit.cover,
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
          ),
          Positioned(
            top: MediaQuery.sizeOf(context).height / 3,
            child: Image.asset("assets/images/splash2.png"),
          ),
        ],
      ),
    ));
  }
}
