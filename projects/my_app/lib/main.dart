// TASK-9 : Stack Widgets

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ProfileAvatarScreen(),
    );
  }
}

class ProfileAvatarScreen extends StatelessWidget {
  const ProfileAvatarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task-8B: Profile Avatars"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // -------- Profile with camera icon --------
            const Text(
              "Profile with Camera Icon",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                const CircleAvatar(
                  radius: 90,
                  backgroundImage: AssetImage("assets/images/profile.jpg"),
                ),
                Positioned(
                  right: -5,
                  bottom: -5,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // -------- Profile with online indicator --------
            const Text(
              "Profile with Online Indicator",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                const CircleAvatar(
                  radius: 90,
                  backgroundImage: AssetImage("assets/images/profile.jpg"),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
