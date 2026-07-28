import 'package:flutter/material.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  Widget attendanceCard(String subject, String attendance, Color color) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: CircleAvatar(
          radius: 24,
          backgroundColor: color,
          child: Text(
            attendance,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          subject,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: const Text("Current Attendance"),
        trailing: const Icon(Icons.check_circle, color: Colors.green),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Attendance", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 15),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 170,
                  height: 170,
                  child: CircularProgressIndicator(
                    value: 0.85,
                    strokeWidth: 10,
                    backgroundColor: Colors.grey.shade300,
                    color: Colors.green,
                  ),
                ),
                const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "85%",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Overall"),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          attendanceCard("Flutter Development", "90%", Colors.blue),
          attendanceCard("Java Programming", "82%", Colors.orange),
          attendanceCard("Python Programming", "84%", Colors.green),
        ],
      ),
    );
  }
}
