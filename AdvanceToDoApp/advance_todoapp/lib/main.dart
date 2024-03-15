import 'package:flutter/material.dart';
import 'package:advance_todoapp/todoapp.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ToDoApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}
