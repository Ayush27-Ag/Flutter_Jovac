import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Widget infoTile(IconData icon, String title, String value) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.deepPurple.shade100,
          child: Icon(icon, color: Colors.deepPurple),
        ),
        title: Text(title),
        subtitle: Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: const Text(
          "Student Profile",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage("assets/images/student.png"),
            ),
            const SizedBox(height: 10),
            const Text(
              "Ayush Agarwal",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text(
              "B.Tech Computer Science",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            infoTile(Icons.badge, "Roll Number", "101"),
            infoTile(Icons.school, "Course", "B.Tech CSE"),
            infoTile(Icons.email, "Email", "ayushag@gmail.com"),
            infoTile(Icons.phone, "Mobile", "+91 9876543210"),
            infoTile(Icons.location_on, "City", "Mathura"),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
