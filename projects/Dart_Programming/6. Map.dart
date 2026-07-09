// Map Data type in Dart: Map used to store data in a Key-value pair
// It is similar to Dictionary in Python and Object in JS

void main() {
  Map<String, String> student = {
    "name": "Pankaj",
    "city": "Noida",
    "course": "Flutter",
  };
  print(student);

  print(student["name"]);
  // Updating the Data of a particular Key
  student["city"] = "Delhi";
  print(student);

  student.remove("course");
  print(student);

  print(student.keys);
  print(student.values);
  print(student.length);

  Map<String, dynamic> studentData = {
    "name": "Rahul",
    "age": 21,
    "distance": 1.5,
    "hobbies": ["Music", "Cricket", "Vlogging"],
  };
  print(studentData);

  List<Map<String, dynamic>> students = [
    {"name": "Rahul", "age": 21, "distance": 1.5},
    {},
    {},
    {},
    {},
  ];
}
