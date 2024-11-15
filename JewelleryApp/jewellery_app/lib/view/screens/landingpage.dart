import 'package:flutter/material.dart';
import 'package:jewellery_app/controller/database_connection.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    dbConnection();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      // Navigate to the home screen
      Navigator.of(context).pushReplacementNamed("/homescreen");
    });
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 236, 219, 1),
      body: Column(
        children: [
          Image.asset(
            "assets/images/layer.png",
          ),
          Image.asset(
            "assets/images/logo.png",
          ),
          Expanded(
            child: Image.asset(
              "assets/images/layer.png",
            ),
          ),
        ],
      ),
    );
  }
}
