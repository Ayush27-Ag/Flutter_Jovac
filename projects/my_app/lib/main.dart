import 'package:flutter/material.dart';

import 'registration_screen.dart';

void main() {
  runApp(const PlacementApp());
}

class PlacementApp extends StatelessWidget {
  const PlacementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: "Student Placement",

      theme: ThemeData(
        useMaterial3: false,

        primarySwatch: Colors.deepPurple,

        scaffoldBackgroundColor: const Color(0xffF5F6FA),

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),

      home: const RegistrationScreen(),
    );
  }
}
