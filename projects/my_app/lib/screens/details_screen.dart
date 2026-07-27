import 'package:flutter/material.dart';

class StudentDetailsScreen extends StatefulWidget {
  final String name;
  final String roll;
  final String course;

  const StudentDetailsScreen({
    super.key,
    required this.name,
    required this.roll,
    required this.course,
  });

  @override
  State<StudentDetailsScreen> createState() => _StudentDetailsScreenState();
}

class _StudentDetailsScreenState extends State<StudentDetailsScreen> {
  late String currentCourse;

  @override
  void initState() {
    super.initState();
    currentCourse = widget.course;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Student Details",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    const Text(
                      "Student Details",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Row(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.blue.shade100,
                          child: const Icon(Icons.person, color: Colors.blue),
                        ),

                        const SizedBox(width: 15),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Name",
                              style: TextStyle(color: Colors.black54),
                            ),

                            Text(
                              widget.name,
                              style: const TextStyle(fontSize: 22),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    Row(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.green.shade100,
                          child: const Icon(Icons.badge, color: Colors.green),
                        ),

                        const SizedBox(width: 15),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Roll No",
                              style: TextStyle(color: Colors.black54),
                            ),

                            Text(
                              widget.roll,
                              style: const TextStyle(fontSize: 22),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    Row(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.indigo.shade100,
                          child: const Icon(Icons.school, color: Colors.indigo),
                        ),

                        const SizedBox(width: 15),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Course",
                              style: TextStyle(color: Colors.black54),
                            ),

                            Text(
                              currentCourse,
                              style: const TextStyle(
                                fontSize: 22,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                ),
                icon: const Icon(Icons.edit, color: Colors.white),
                label: const Text(
                  "Edit Course",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  final result = await Navigator.pushNamed(
                    context,
                    "/edit",
                    arguments: currentCourse,
                  );

                  if (result != null) {
                    setState(() {
                      currentCourse = result.toString();
                    });
                  }
                },
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton.icon(
                icon: const Icon(Icons.arrow_back),
                label: const Text("Go Back"),
                onPressed: () {
                  Navigator.pop(context, currentCourse);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
