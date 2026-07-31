import 'package:flutter/material.dart';

import '../database/database_helper.dart';
import '../models/student_model.dart';
import 'student_list_screen.dart';
import 'success_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final rollController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final cgpaController = TextEditingController();

  String department = "Computer Science";
  String semester = "Semester 6";

  final List<String> departments = [
    "Computer Science",
    "Information Technology",
    "Electronics",
    "Mechanical",
    "Civil",
  ];

  final List<String> semesters = [
    "Semester 1",
    "Semester 2",
    "Semester 3",
    "Semester 4",
    "Semester 5",
    "Semester 6",
    "Semester 7",
    "Semester 8",
  ];

  Widget fieldTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Text(
          title,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  InputDecoration decoration(String hint, IconData icon) {
    return InputDecoration(
      prefixIcon: Icon(icon, size: 20, color: Colors.black87),
      hintText: hint,
      hintStyle: const TextStyle(fontSize: 15),
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "Student Registration",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),

        child: Form(
          key: _formKey,

          child: Column(
            children: [
              fieldTitle("Student Name"),

              TextFormField(
                controller: nameController,
                style: const TextStyle(fontSize: 15),
                decoration: decoration("Name", Icons.person),
              ),

              const SizedBox(height: 10),

              fieldTitle("Roll Number"),

              TextFormField(
                controller: rollController,
                style: const TextStyle(fontSize: 15),
                decoration: decoration("Roll Number", Icons.badge),
              ),

              const SizedBox(height: 10),

              fieldTitle("Email Address"),

              TextFormField(
                controller: emailController,
                style: const TextStyle(fontSize: 15),
                decoration: decoration("Email", Icons.email),
              ),

              const SizedBox(height: 10),

              fieldTitle("Mobile Number"),

              TextFormField(
                controller: mobileController,
                style: const TextStyle(fontSize: 15),
                decoration: decoration("Mobile", Icons.phone),
              ),

              const SizedBox(height: 10),

              fieldTitle("Department"),

              DropdownButtonFormField(
                value: department,
                decoration: decoration("", Icons.school),
                items: departments.map((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(e, style: const TextStyle(fontSize: 15)),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    department = value!;
                  });
                },
              ),

              const SizedBox(height: 10),

              fieldTitle("Semester"),

              DropdownButtonFormField(
                value: semester,
                decoration: decoration("", Icons.calendar_today),
                items: semesters.map((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(e, style: const TextStyle(fontSize: 13)),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    semester = value!;
                  });
                },
              ),

              const SizedBox(height: 10),

              fieldTitle("CGPA"),

              TextFormField(
                controller: cgpaController,
                style: const TextStyle(fontSize: 15),
                keyboardType: TextInputType.number,
                decoration: decoration("CGPA", Icons.grade),
              ),

              const SizedBox(height: 18),

              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 42,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        icon: const Icon(
                          Icons.save,
                          color: Colors.white,
                          size: 18,
                        ),
                        label: const Text(
                          "Register Student",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            Student student = Student(
                              studentName: nameController.text.trim(),
                              rollNumber: rollController.text.trim(),
                              email: emailController.text.trim(),
                              mobile: mobileController.text.trim(),
                              department: department,
                              semester: semester,
                              cgpa: double.parse(cgpaController.text),
                            );

                            await DatabaseHelper.instance.insertStudent(
                              student,
                            );

                            if (!mounted) return;

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => SuccessScreen(student: student),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: SizedBox(
                      height: 42,
                      child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.deepPurple),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        icon: const Icon(
                          Icons.list,
                          size: 18,
                          color: Colors.deepPurple,
                        ),
                        label: const Text(
                          "View Students",
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const StudentListScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    rollController.dispose();
    emailController.dispose();
    mobileController.dispose();
    cgpaController.dispose();
    super.dispose();
  }
}
