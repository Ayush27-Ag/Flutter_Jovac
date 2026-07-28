import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'notice_tab.dart';
import 'result_tab.dart';
import 'profile_screen.dart';

class HomeTabs extends StatelessWidget {
  final int initialIndex;

  const HomeTabs({super.key, this.initialIndex = 0});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: initialIndex,
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
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const HomeScreen()),
                    (route) => false,
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text("Profile"),
                onTap: () {
                  Navigator.pop(context);

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ProfileScreen()),
                  );
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

        appBar: AppBar(
          backgroundColor: const Color(0xff4527C8),
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            "College Student Portal",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none, color: Colors.white),
            ),
          ],
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: "Courses"),
              Tab(text: "Notices"),
              Tab(text: "Results"),
            ],
          ),
        ),

        body: const TabBarView(
          children: [CoursesTab(), NoticeTab(), ResultTab()],
        ),
      ),
    );
  }
}

class CoursesTab extends StatelessWidget {
  const CoursesTab({super.key});

  Widget courseCard(
    String image,
    String title,
    String subtitle,
    String teacher,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Image.asset(image, width: 50, height: 50, fit: BoxFit.contain),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        subtitle: Text(
          "$subtitle\nInstructor: $teacher",
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 10),
      children: [
        courseCard(
          "assets/images/flutter.png",
          "Flutter Development",
          "Learn Flutter from Basics",
          "Mr. Sharma",
        ),
        courseCard(
          "assets/images/java.png",
          "Java Programming",
          "Core Java and OOPs",
          "Ms. Joshi",
        ),
        courseCard(
          "assets/images/python.png",
          "Python Programming",
          "Python for Beginners",
          "Mr. Verma",
        ),
      ],
    );
  }
}
