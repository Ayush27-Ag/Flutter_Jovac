void main() {
  List<String> students = ["Rahul", "Priya", "Aman", "Sneha", "Karan"];

  Map<String, int> marks = {
    "Rahul": 85,
    "Priya": 72,
    "Aman": 91,
    "Sneha": 65,
    "Karan": 38,
  };

  // for loop
  for (int i = 0; i < students.length; i++) {
    String temp = students[i];
  }

  // while loop
  int i = 0;
  while (i < students.length) {
    String temp = students[i];
    i++;
  }

  // do-while loop
  int j = 0;
  do {
    String temp = students[j];
    j++;
  } while (j < students.length);

  // for-in loop
  for (String student in students) {
    String temp = student;
  }

  // forEach loop
  students.forEach((student) {
    String temp = student;
  });

  print("=========================================");
  print("         STUDENT GRADE REPORT");
  print("=========================================");

  for (String student in students) {
    int mark = marks[student]!;

    String grade;

    if (mark >= 90) {
      grade = "A+";
    } else if (mark >= 80) {
      grade = "A";
    } else if (mark >= 70) {
      grade = "B";
    } else if (mark >= 60) {
      grade = "C";
    } else if (mark >= 40) {
      grade = "D";
    } else {
      grade = "Fail";
    }

    String remarks;

    switch (grade) {
      case "A+":
        remarks = "Outstanding";
        break;
      case "A":
        remarks = "Excellent";
        break;
      case "B":
        remarks = "Very Good";
        break;
      case "C":
        remarks = "Good";
        break;
      case "D":
        remarks = "Needs Improvement";
        break;
      default:
        remarks = "Failed";
    }

    print("Student : $student");
    print("Marks   : $mark");
    print("Grade   : $grade");
    print("Remarks : $remarks");
    print("-----------------------------------------");
  }

  print("=========================================");
}
