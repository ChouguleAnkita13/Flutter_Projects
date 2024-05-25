import 'package:flutter/material.dart';
import 'package:jewellery_app/routes/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:initialScreen,
      routes: myroutes,
      debugShowCheckedModeBanner: false,
    );
  }
}
