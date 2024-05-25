import 'package:flutter/material.dart';
import 'package:jewellery_app/database/database_connection.dart';

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
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 236, 219, 1),
      body: Column(
        children: [
          Image.asset(
            "assets/images/layer.png",
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed("/home"),
            child: Image.asset(
              "assets/images/logo.png",
            ),
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
