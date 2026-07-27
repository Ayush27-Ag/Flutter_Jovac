import 'package:flutter/material.dart';
import 'screens/details_screen.dart';
import 'screens/edit_course_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Student Information",
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/edit': (context) => const EditCourseScreen(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController nameController = TextEditingController(
    text: "Ayush Agarwal",
  );

  final TextEditingController rollController = TextEditingController(
    text: "101",
  );

  String selectedCourse = "Flutter";
  String updatedCourse = "Java";

  List<String> courses = ["Flutter", "Java", "Python", "AI"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Student Information",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset("assets/images/graduation.png", height: 220),
            ),

            const SizedBox(height: 20),

            const Text("Student Name"),

            const SizedBox(height: 6),

            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            const SizedBox(height: 16),

            const Text("Roll Number"),

            const SizedBox(height: 6),

            TextField(
              controller: rollController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            const SizedBox(height: 16),

            const Text("Select Course"),

            const SizedBox(height: 6),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedCourse,
                  isExpanded: true,
                  items: courses.map((course) {
                    return DropdownMenuItem(value: course, child: Text(course));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCourse = value!;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 22),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                icon: const Icon(Icons.open_in_new, color: Colors.white),
                label: const Text(
                  "View Details",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StudentDetailsScreen(
                        name: nameController.text,
                        roll: rollController.text,
                        course: selectedCourse,
                      ),
                    ),
                  );

                  if (result != null) {
                    setState(() {
                      updatedCourse = result;
                    });
                  }
                },
              ),
            ),

            const SizedBox(height: 18),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  const Text(
                    "Updated Course :",
                    style: TextStyle(color: Colors.green),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    updatedCourse,
                    style: const TextStyle(fontSize: 22, color: Colors.green),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
