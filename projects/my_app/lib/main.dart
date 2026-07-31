import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const StudentAssignmentApp());
}

class StudentAssignmentApp extends StatelessWidget {
  const StudentAssignmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Assignment Portal',
      theme: ThemeData(useMaterial3: false, primarySwatch: Colors.deepPurple),
      home: const HomeScreen(),
    );
  }
}
