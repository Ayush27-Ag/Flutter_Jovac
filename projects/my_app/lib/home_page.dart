import 'package:flutter/material.dart';
import 'home_tab.dart';
import 'assignment_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget quickCard(
    BuildContext context,
    IconData icon,
    Color color,
    String title,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 95,
        decoration: BoxDecoration(
          color: color.withOpacity(0.15),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 35),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xff00B4DB), Color(0xff0083B0)],
                ),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome Back 👋",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Ayush Agarwal",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "B.Tech CSE | Roll No: 101",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    radius: 42,
                    backgroundImage: AssetImage("assets/images/student.png"),
                  ),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Quick Links",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: quickCard(
                      context,
                      Icons.menu_book,
                      Colors.orange,
                      "Courses",
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const HomeTabs(initialIndex: 0),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: quickCard(
                      context,
                      Icons.campaign,
                      Colors.deepPurple,
                      "Notices",
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const HomeTabs(initialIndex: 1),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: quickCard(
                      context,
                      Icons.assignment,
                      Colors.green,
                      "Assignments",
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const AssignmentScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: quickCard(
                      context,
                      Icons.bar_chart,
                      Colors.red,
                      "Results",
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const HomeTabs(initialIndex: 2),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
