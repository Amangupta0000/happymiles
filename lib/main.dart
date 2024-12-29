import 'package:flutter/material.dart';

import 'package:happymiles/screens/authorization/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Happy Miles',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Roboto',
          textTheme: const TextTheme(
            headlineLarge: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            headlineMedium: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
            bodyMedium: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black),
          ),
        ),
        home: SignUpScreen());
  }
}
