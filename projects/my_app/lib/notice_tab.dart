import 'package:flutter/material.dart';

class NoticeTab extends StatelessWidget {
  const NoticeTab({super.key});

  Widget noticeCard(
    IconData icon,
    Color color,
    String title,
    String date,
    String subtitle,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(icon, color: color, size: 36),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("$date\n$subtitle"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        noticeCard(
          Icons.campaign,
          Colors.deepPurple,
          "Holiday Tomorrow",
          "20 May 2025",
          "College will remain closed tomorrow\non account of Local Holiday.",
        ),
        noticeCard(
          Icons.description,
          Colors.blue,
          "Flutter Assignment Submission",
          "18 May 2025",
          "Submit your Flutter Assignment-13\nbefore 22 May 2025.",
        ),
        noticeCard(
          Icons.calendar_month,
          Colors.orange,
          "Mid Semester Exam",
          "15 May 2025",
          "Mid Semester Exams will start from\n1st June 2025.",
        ),
      ],
    );
  }
}
