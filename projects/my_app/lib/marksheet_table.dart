import 'package:flutter/material.dart';

class MarksheetTable extends StatelessWidget {
  const MarksheetTable({super.key});

  TableRow tableRow(String subject, String maxMarks, String obtained) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(subject, textAlign: TextAlign.center),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(maxMarks, textAlign: TextAlign.center),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            obtained,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: int.parse(obtained) >= 90 ? Colors.green : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: const [
                Icon(Icons.table_chart, color: Colors.deepPurple),
                SizedBox(width: 10),
                Text(
                  "Student Marksheet",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Table(
              border: TableBorder.all(color: Colors.grey.shade400),
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(1.5),
                2: FlexColumnWidth(1.5),
              },
              children: [
                TableRow(
                  decoration: const BoxDecoration(color: Colors.deepPurple),
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Subject",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Max Marks",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Obtained",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                tableRow("Mathematics", "100", "95"),
                tableRow("Science", "100", "90"),
                tableRow("English", "100", "88"),
                tableRow("Computer", "100", "98"),
                tableRow("Hindi", "100", "85"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
