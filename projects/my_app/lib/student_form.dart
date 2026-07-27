import 'package:flutter/material.dart';

class StudentForm extends StatefulWidget {
  const StudentForm({super.key});

  @override
  State<StudentForm> createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final rollController = TextEditingController();
  final cityController = TextEditingController();

  String? selectedCourse;

  final List<String> courseList = [
    "B.Tech Computer Science",
    "B.Tech Information Technology",
    "BCA",
    "MCA",
  ];

  InputDecoration fieldDecoration(String text, IconData icon) {
    return InputDecoration(
      labelText: text,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff3728C7),
        centerTitle: true,
        title: const Text(
          "Student Registration",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CircleAvatar(
                radius: 36,
                backgroundColor: const Color(0xffF2EEFF),
                child: Image.asset(
                  "assets/images/student_registration_icon.png",
                  height: 55,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Student Registration",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              const Text(
                "Please fill in the details to register",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 22),
              TextFormField(
                controller: nameController,
                decoration: fieldDecoration("Full Name *", Icons.person),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter your full name";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 18),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: fieldDecoration("Email Address *", Icons.email),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email address";
                  }
                  if (!value.contains("@")) {
                    return "Enter a valid email";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 18),
              TextFormField(
                controller: mobileController,
                keyboardType: TextInputType.phone,
                decoration: fieldDecoration("Mobile Number *", Icons.phone),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your mobile number";
                  }
                  if (value.length != 10) {
                    return "Enter a valid 10 digit mobile number";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 18),
              TextFormField(
                controller: rollController,
                keyboardType: TextInputType.number,
                decoration: fieldDecoration("Roll Number *", Icons.badge),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your roll number";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 18),
              DropdownButtonFormField<String>(
                value: selectedCourse,
                decoration: fieldDecoration("Course *", Icons.menu_book),
                items: courseList.map((course) {
                  return DropdownMenuItem(value: course, child: Text(course));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCourse = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return "Please select your course";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 18),
              TextFormField(
                controller: cityController,
                decoration: fieldDecoration("City *", Icons.location_city),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your city";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.refresh),
                      label: const Text("Reset"),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: const BorderSide(color: Color(0xff3728C7)),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        _formKey.currentState!.reset();
                        nameController.clear();
                        emailController.clear();
                        mobileController.clear();
                        rollController.clear();
                        cityController.clear();
                        setState(() {
                          selectedCourse = null;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.send),
                      label: const Text("Submit"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff3728C7),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                title: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundColor: Colors.green.shade100,
                                      child: const Icon(
                                        Icons.check_circle,
                                        color: Colors.green,
                                        size: 40,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    const Text(
                                      "Registration Successful!",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Full Name : ${nameController.text}"),
                                    const SizedBox(height: 6),
                                    Text("Email : ${emailController.text}"),
                                    const SizedBox(height: 6),
                                    Text("Mobile : ${mobileController.text}"),
                                    const SizedBox(height: 6),
                                    Text(
                                      "Roll Number : ${rollController.text}",
                                    ),
                                    const SizedBox(height: 6),
                                    Text("Course : $selectedCourse"),
                                    const SizedBox(height: 6),
                                    Text("City : ${cityController.text}"),
                                  ],
                                ),
                                actionsAlignment: MainAxisAlignment.center,
                                actions: [
                                  SizedBox(
                                    width: 120,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(
                                          0xff3728C7,
                                        ),
                                        foregroundColor: Colors.white,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("OK"),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
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
}
