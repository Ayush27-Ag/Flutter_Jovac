import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import 'shared_pref_service.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final nameController = TextEditingController();
  final rollController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final cgpaController = TextEditingController();

  List<String> branches = [
    "Computer Science",
    "Information Technology",
    "Electronics",
    "Mechanical",
    "Civil",
  ];

  String branch = "Computer Science";
  bool interested = true;
  bool saved = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final data = await SharedPrefService.getStudentData();

    if (data["name"] != "") {
      nameController.text = data["name"];
      rollController.text = data["roll"];
      emailController.text = data["email"];
      mobileController.text = data["mobile"];
      cgpaController.text = data["cgpa"];

      if (branches.contains(data["branch"])) {
        branch = data["branch"];
      }

      interested = data["interested"];
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Student Placement Registration")),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
          child: Column(
            children: [
              Image.asset("assets/images/placement_banner.png", height: 170),
              const SizedBox(height: 12),
              const Text(
                "Register Your Details",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    buildField(
                      controller: nameController,
                      hint: "Student Name",
                      icon: Icons.person,
                    ),
                    const SizedBox(height: 16),

                    buildField(
                      controller: rollController,
                      hint: "Roll Number",
                      icon: Icons.badge,
                    ),
                    const SizedBox(height: 16),

                    buildField(
                      controller: emailController,
                      hint: "Email Address",
                      icon: Icons.email,
                    ),
                    const SizedBox(height: 16),

                    buildField(
                      controller: mobileController,
                      hint: "Mobile Number",
                      icon: Icons.phone,
                    ),
                    const SizedBox(height: 16),

                    DropdownButtonFormField<String>(
                      value: branch,
                      decoration: InputDecoration(
                        hintText: "Select Branch",
                        prefixIcon: const Icon(
                          Icons.school,
                          color: Colors.deepPurple,
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 18,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      items: branches.map((e) {
                        return DropdownMenuItem(value: e, child: Text(e));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          branch = value!;
                        });
                      },
                    ),

                    const SizedBox(height: 16),

                    buildField(
                      controller: cgpaController,
                      hint: "CGPA",
                      icon: Icons.grade,
                    ),

                    const SizedBox(height: 18),

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: SwitchListTile(
                        value: interested,
                        activeColor: Colors.deepPurple,
                        title: const Text(
                          "Interested in Placement",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        onChanged: (value) {
                          setState(() {
                            interested = value;
                          });
                        },
                      ),
                    ),

                    const SizedBox(height: 22),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: ElevatedButton.icon(
                              onPressed: () async {
                                if (nameController.text.isEmpty ||
                                    rollController.text.isEmpty ||
                                    emailController.text.isEmpty ||
                                    mobileController.text.isEmpty ||
                                    cgpaController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Please fill all fields"),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                  return;
                                }

                                await SharedPrefService.saveStudentData(
                                  name: nameController.text,
                                  roll: rollController.text,
                                  email: emailController.text,
                                  mobile: mobileController.text,
                                  branch: branch,
                                  cgpa: cgpaController.text,
                                  interested: interested,
                                );

                                setState(() {
                                  saved = true;
                                });

                                Future.delayed(const Duration(seconds: 10), () {
                                  if (!mounted) return;

                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const DashboardScreen(),
                                    ),
                                  );
                                });
                              },
                              icon: const Icon(Icons.save, color: Colors.white),
                              label: const Text(
                                "SAVE DETAILS",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurple,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: OutlinedButton.icon(
                              onPressed: () {
                                nameController.clear();
                                rollController.clear();
                                emailController.clear();
                                mobileController.clear();
                                cgpaController.clear();

                                setState(() {
                                  branch = branches.first;
                                  interested = true;
                                  saved = false;
                                });
                              },
                              icon: const Icon(Icons.delete_outline),
                              label: const Text(
                                "CLEAR FORM",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.deepPurple,
                                side: const BorderSide(
                                  color: Colors.deepPurple,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    if (saved)
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.green),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.check_circle, color: Colors.green),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                "Registration Saved Successfully!",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon, color: Colors.deepPurple),
        filled: true,
        fillColor: Colors.grey.shade100,
        contentPadding: const EdgeInsets.symmetric(vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
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
