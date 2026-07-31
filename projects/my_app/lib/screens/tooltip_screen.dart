import 'package:flutter/material.dart';

class TooltipScreen extends StatelessWidget {
  const TooltipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "Tooltip Demo",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildItem(Icons.calendar_month, "Select Date"),
                buildItem(Icons.access_time, "Select Time"),
                buildItem(Icons.folder, "Upload File"),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildItem(Icons.star, "Rate Experience"),
                buildItem(Icons.description, "Open Guidelines"),
                buildItem(Icons.language, "Open Docs"),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                "Long press on any icon\n to see tooltip",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItem(IconData icon, String tooltip) {
    return Tooltip(
      message: tooltip,
      child: Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [BoxShadow(blurRadius: 5, color: Colors.black12)],
        ),
        child: Icon(icon, size: 42, color: Colors.deepPurple),
      ),
    );
  }
}
