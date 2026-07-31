import 'package:flutter/material.dart';

class GuidelineScreen extends StatelessWidget {
  const GuidelineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "Assignment Guidelines",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Assignment Guidelines",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 25),

            Text(
              "Objective",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),

            Text(
              "Build a Flutter application using the widgets learned in the class.",
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 25),

            Text(
              "Instructions",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Text("• Use proper UI design."),
            SizedBox(height: 8),

            Text("• Follow best coding practices."),
            SizedBox(height: 8),

            Text("• Submit before the last date."),
            SizedBox(height: 8),

            Text("• Upload in PDF or ZIP format."),
          ],
        ),
      ),
    );
  }
}
