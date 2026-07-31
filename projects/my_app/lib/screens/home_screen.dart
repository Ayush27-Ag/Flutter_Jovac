import 'package:flutter/material.dart';
import 'submission_screen.dart';
import 'guideline_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),

      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "Student Assignment Portal",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.notifications),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.deepPurple,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: "My Submissions",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Image.asset("assets/images/assignment.png", height: 130),

              const SizedBox(height: 15),

              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(15),

                  child: Column(
                    children: [
                      buildRow("Assignment", "Flutter UI Widgets"),

                      buildRow("Subject", "Mobile Application Dev."),

                      buildRow("Faculty", "Mr. Pankaj Kapoor"),

                      buildRow("Last Date", "30 July 2026"),

                      buildRow("Total Marks", "100"),

                      const SizedBox(height: 20),

                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                          ),
                          icon: const Icon(
                            Icons.upload_file,
                            color: Colors.white,
                          ),
                          label: const Text(
                            "Submit Assignment",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const SubmissionScreen(),
                              ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 10),

                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: OutlinedButton.icon(
                          icon: const Icon(
                            Icons.description,
                            color: Colors.deepPurple,
                          ),
                          label: const Text(
                            "View Assignment Guidelines",
                            style: TextStyle(color: Colors.deepPurple),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const GuidelineScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          SizedBox(
            width: 95,
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),

          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
