import 'package:flutter/material.dart';
import 'student_card.dart';
import 'marksheet_table.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void showStudentActions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.email),
                title: const Text("Send Email"),
                onTap: () {
                  Navigator.pop(context);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text("Email Sent Successfully"),
                      backgroundColor: Colors.green,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                },
              ),

              ListTile(
                leading: const Icon(Icons.call),
                title: const Text("Call Student"),
                onTap: () {
                  Navigator.pop(context);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text("Calling Student..."),
                      backgroundColor: Colors.green,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                },
              ),

              ListTile(
                leading: const Icon(Icons.location_on),
                title: const Text("View Address"),
                onTap: () {
                  Navigator.pop(context);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text("Opening Address..."),
                      backgroundColor: Colors.green,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                },
              ),

              ListTile(
                leading: const Icon(Icons.share),
                title: const Text("Share Profile"),
                onTap: () {
                  Navigator.pop(context);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      margin: const EdgeInsets.all(12),
                      backgroundColor: Colors.green.shade700,
                      behavior: SnackBarBehavior.floating,
                      duration: const Duration(seconds: 3),
                      content: Row(
                        children: [
                          const CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.check,
                              color: Colors.green,
                              size: 18,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Text(
                              "Student Profile Shared Successfully!",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      action: SnackBarAction(
                        label: "UNDO",
                        textColor: Colors.white,
                        onPressed: () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        },
                      ),
                    ),
                  );
                },
              ),

              ListTile(
                leading: const Icon(Icons.download),
                title: const Text("Download Marksheet"),
                onTap: () {
                  Navigator.pop(context);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text("MarkSheet Downloaded"),
                      backgroundColor: Colors.green,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                },
              ),

              ListTile(
                leading: const Icon(Icons.close),
                title: const Text("Close"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget summaryCard(IconData icon, String title, String value, Color color) {
    return Expanded(
      child: Card(
        elevation: 6,
        shadowColor: color.withOpacity(0.3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            children: [
              Icon(icon, color: color, size: 34),
              const SizedBox(height: 10),
              Text(title),
              const SizedBox(height: 5),
              Text(
                value,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F6FA),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        title: const Row(
          children: [
            Icon(Icons.school, color: Colors.white, size: 28),
            SizedBox(width: 10),
            Text(
              "Student Information Portal",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert, color: Colors.white),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),

            const StudentCard(),

            const SizedBox(height: 15),

            const MarksheetTable(),

            const SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  summaryCard(
                    Icons.assignment,
                    "Total Marks",
                    "456 / 500",
                    Colors.deepPurple,
                  ),
                  summaryCard(
                    Icons.percent,
                    "Percentage",
                    "91.2%",
                    Colors.black,
                  ),
                  summaryCard(Icons.star, "Grade", "A+", Colors.orange),
                ],
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: 350,
              height: 50,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  showStudentActions(context);
                },
                icon: const Icon(Icons.list),
                label: const Text("Show Student Actions"),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
