import 'package:flutter/material.dart';
import 'home_page.dart';
import 'attendance_screen.dart';
import 'assignment_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const HomePage(),
    const AttendanceScreen(),
    const AssignmentScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(color: Color(0xff4527C8)),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage("assets/images/student.png"),
                    ),
                    const SizedBox(width: 12),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ayush Agarwal",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "B.Tech CSE",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Roll No : 101",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Dashboard"),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    currentIndex = 0;
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text("Profile"),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    currentIndex = 3;
                  });
                },
              ),
              const ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
              ),
              const ListTile(leading: Icon(Icons.help), title: Text("Help")),
              const ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
              ),
            ],
          ),
        ),

        body: pages[currentIndex],

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: const Color(0xff4527C8),
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: "Attendance",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              label: "Assignments",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
