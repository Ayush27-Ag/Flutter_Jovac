import 'package:flutter/material.dart';

class ResultTab extends StatelessWidget {
  const ResultTab({super.key});

  Widget resultCard(String subject, String marks, Color color) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: const Icon(Icons.school, color: Colors.white),
        ),
        title: Text(
          subject,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text("Marks Obtained : $marks"),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        resultCard("Flutter Development", "92 / 100", Colors.blue),
        resultCard("Java Programming", "88 / 100", Colors.green),
        resultCard("Python Programming", "95 / 100", Colors.orange),
      ],
    );
  }
}
