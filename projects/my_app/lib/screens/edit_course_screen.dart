import 'package:flutter/material.dart';

class EditCourseScreen extends StatefulWidget {
  const EditCourseScreen({super.key});

  @override
  State<EditCourseScreen> createState() => _EditCourseScreenState();
}

class _EditCourseScreenState extends State<EditCourseScreen> {
  String? selectedCourse;
  bool isLoaded = false;

  @override
  Widget build(BuildContext context) {
    if (!isLoaded) {
      selectedCourse = ModalRoute.of(context)!.settings.arguments as String?;
      isLoaded = true;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Edit Course", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Select New Course",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                RadioListTile<String>(
                  title: const Text("Flutter"),
                  value: "Flutter",
                  groupValue: selectedCourse,
                  activeColor: Colors.orange,
                  onChanged: (value) {
                    setState(() {
                      selectedCourse = value!;
                    });
                  },
                ),

                RadioListTile<String>(
                  title: const Text("Java"),
                  value: "Java",
                  groupValue: selectedCourse,
                  activeColor: Colors.orange,
                  onChanged: (value) {
                    setState(() {
                      selectedCourse = value!;
                    });
                  },
                ),

                RadioListTile<String>(
                  title: const Text("Python"),
                  value: "Python",
                  groupValue: selectedCourse,
                  activeColor: Colors.orange,
                  onChanged: (value) {
                    setState(() {
                      selectedCourse = value!;
                    });
                  },
                ),

                RadioListTile<String>(
                  title: const Text("AI"),
                  value: "AI",
                  groupValue: selectedCourse,
                  activeColor: Colors.orange,
                  onChanged: (value) {
                    setState(() {
                      selectedCourse = value!;
                    });
                  },
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                    icon: const Icon(Icons.check, color: Colors.white),
                    label: const Text(
                      "Save Changes",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.pop(context, selectedCourse);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
