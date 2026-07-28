import 'package:flutter/material.dart';

class AssignmentScreen extends StatelessWidget {
  const AssignmentScreen({super.key});

  Widget assignmentCard(String title, String dueDate, Color color) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      elevation: 3,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: const Icon(Icons.assignment, color: Colors.white),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("Due Date : $dueDate"),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assignments", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          assignmentCard("Flutter Assignment 13", "22 May 2025", Colors.blue),
          assignmentCard("Java Mini Project", "25 May 2025", Colors.orange),
          assignmentCard("Python Practical", "30 May 2025", Colors.green),
        ],
      ),
    );
  }
}
