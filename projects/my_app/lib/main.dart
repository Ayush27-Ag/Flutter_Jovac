import 'package:flutter/material.dart';
import 'student_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Student Registration",
      theme: ThemeData(primaryColor: const Color(0xff3728C7)),
      home: const StudentForm(),
    );
  }
}
