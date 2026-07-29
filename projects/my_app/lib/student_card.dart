import 'package:flutter/material.dart';

class StudentCard extends StatelessWidget {
  const StudentCard({super.key});

  Widget detailRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.black87, size: 22),
          const SizedBox(width: 15),

          SizedBox(
            width: 110,
            child: SelectableText(title, style: const TextStyle(fontSize: 16)),
          ),

          Expanded(
            child: SelectableText(
              value,
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: const [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.deepPurple,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                SizedBox(width: 12),
                Text(
                  "Student Details",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),

            const Divider(height: 30),
            detailRow(Icons.person, "Student Name", "Ayush Agarwal"),
            detailRow(Icons.email, "Email", "ayush@gmail.com"),
            detailRow(Icons.phone, "Mobile", "+91 9876543210"),
            detailRow(Icons.badge, "Roll Number", "101"),
            detailRow(
              Icons.language,
              "College Website",
              "www.fluttercollege.com",
            ),
          ],
        ),
      ),
    );
  }
}
