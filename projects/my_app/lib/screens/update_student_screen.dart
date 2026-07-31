import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class UpdateStudentScreen extends StatefulWidget {
  final int index;
  final Map<String, dynamic> student;

  const UpdateStudentScreen({
    super.key,
    required this.index,
    required this.student,
  });

  @override
  State<UpdateStudentScreen> createState() => _UpdateStudentScreenState();
}

class _UpdateStudentScreenState extends State<UpdateStudentScreen> {
  late TextEditingController nameController;
  late TextEditingController courseController;
  late TextEditingController ageController;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(text: widget.student["name"]);

    courseController = TextEditingController(text: widget.student["course"]);

    ageController = TextEditingController(text: widget.student["age"]);
  }

  @override
  void dispose() {
    nameController.dispose();
    courseController.dispose();
    ageController.dispose();
    super.dispose();
  }

  void updateStudent() {
    if (nameController.text.trim().isEmpty ||
        courseController.text.trim().isEmpty ||
        ageController.text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please fill all fields")));
      return;
    }

    final box = Hive.box('students');

    box.putAt(widget.index, {
      "name": nameController.text.trim(),
      "course": courseController.text.trim(),
      "age": ageController.text.trim(),
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Student Updated Successfully")),
    );

    Navigator.pop(context);
  }

  InputDecoration decoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Update Student",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Name", style: TextStyle(fontWeight: FontWeight.w500)),

            const SizedBox(height: 8),

            TextField(
              controller: nameController,
              decoration: decoration("Name"),
            ),

            const SizedBox(height: 20),

            const Text("Course", style: TextStyle(fontWeight: FontWeight.w500)),

            const SizedBox(height: 8),

            TextField(
              controller: courseController,
              decoration: decoration("Course"),
            ),

            const SizedBox(height: 20),

            const Text("Age", style: TextStyle(fontWeight: FontWeight.w500)),

            const SizedBox(height: 8),

            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: decoration("Age"),
            ),

            const SizedBox(height: 35),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: updateStudent,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: const Text(
                  "UPDATE STUDENT",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.deepPurple),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: const Text(
                  "CANCEL",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
