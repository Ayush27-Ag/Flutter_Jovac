import 'package:flutter/material.dart';

import '../database/database_helper.dart';
import '../models/student_model.dart';

class EditStudentScreen extends StatefulWidget {
  final Student student;
  const EditStudentScreen({super.key, required this.student});
  @override
  State<EditStudentScreen> createState() => _EditStudentScreenState();
}

class _EditStudentScreenState extends State<EditStudentScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController rollController;
  late TextEditingController emailController;
  late TextEditingController mobileController;
  late TextEditingController cgpaController;
  late String department;
  late String semester;

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

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.student.studentName);
    rollController = TextEditingController(text: widget.student.rollNumber);
    emailController = TextEditingController(text: widget.student.email);
    mobileController = TextEditingController(text: widget.student.mobile);
    cgpaController = TextEditingController(
      text: widget.student.cgpa.toString(),
    );
    department = widget.student.department;
    semester = widget.student.semester;
  }

  InputDecoration decoration(String hint, IconData icon) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(fontSize: 13),
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      prefixIcon: Icon(icon, size: 17, color: Colors.grey),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(color: Colors.deepPurple, width: 1.2),
      ),
    );
  }

  Widget fieldLabel(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 2, bottom: 5),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }

  Future<void> updateStudent() async {
    if (!_formKey.currentState!.validate()) return;

    Student updatedStudent = Student(
      id: widget.student.id,
      studentName: nameController.text.trim(),
      rollNumber: rollController.text.trim(),
      email: emailController.text.trim(),
      mobile: mobileController.text.trim(),
      department: department,
      semester: semester,
      cgpa: double.parse(cgpaController.text),
    );

    await DatabaseHelper.instance.updateStudent(updatedStudent);

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Student Updated Successfully")),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Edit Student",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              fieldLabel("Student Name"),
              SizedBox(
                height: 44,
                child: TextFormField(
                  controller: nameController,
                  decoration: decoration("Enter Student Name", Icons.person),
                  validator: (value) =>
                      value!.isEmpty ? "Enter Student Name" : null,
                ),
              ),

              const SizedBox(height: 12),

              fieldLabel("Roll Number"),
              SizedBox(
                height: 44,
                child: TextFormField(
                  controller: rollController,
                  decoration: decoration("Enter Roll Number", Icons.badge),
                  validator: (value) =>
                      value!.isEmpty ? "Enter Roll Number" : null,
                ),
              ),

              const SizedBox(height: 12),

              fieldLabel("Email Address"),
              SizedBox(
                height: 44,
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: decoration("Enter Email Address", Icons.email),
                  validator: (value) => value!.isEmpty ? "Enter Email" : null,
                ),
              ),

              const SizedBox(height: 12),

              fieldLabel("Mobile Number"),
              SizedBox(
                height: 44,
                child: TextFormField(
                  controller: mobileController,
                  keyboardType: TextInputType.phone,
                  decoration: decoration("Enter Mobile Number", Icons.phone),
                  validator: (value) =>
                      value!.isEmpty ? "Enter Mobile Number" : null,
                ),
              ),

              const SizedBox(height: 12),
              fieldLabel("Department"),
              SizedBox(
                height: 44,
                child: DropdownButtonFormField<String>(
                  value: department,
                  isExpanded: true,
                  decoration: decoration("Select Department", Icons.school),
                  items: departments
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e, style: const TextStyle(fontSize: 13)),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      department = value!;
                    });
                  },
                ),
              ),

              const SizedBox(height: 12),

              fieldLabel("Semester"),
              SizedBox(
                height: 44,
                child: DropdownButtonFormField<String>(
                  value: semester,
                  isExpanded: true,
                  decoration: decoration(
                    "Select Semester",
                    Icons.calendar_month,
                  ),
                  items: semesters
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e, style: const TextStyle(fontSize: 13)),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      semester = value!;
                    });
                  },
                ),
              ),

              const SizedBox(height: 12),

              fieldLabel("CGPA"),
              SizedBox(
                height: 44,
                child: TextFormField(
                  controller: cgpaController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: decoration("Enter CGPA", Icons.star),
                  validator: (value) => value!.isEmpty ? "Enter CGPA" : null,
                ),
              ),

              const SizedBox(height: 22),

              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: ElevatedButton.icon(
                        onPressed: updateStudent,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 17,
                        ),
                        label: const Text(
                          "Update Student",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.deepPurple,
                          side: const BorderSide(color: Colors.deepPurple),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        icon: const Icon(Icons.close, size: 17),
                        label: const Text(
                          "Cancel",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
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
