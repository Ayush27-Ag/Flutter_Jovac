// List: A way to represent an array DS in dart Programming
// Stores multiple values in a single variable
// Elements are stored by Index
// Index value starts from 0

void main() {
  // List in dart Programming Language
  List<int> numbers = [10, 20, 30, 40];

  print(numbers);
  // Access individual data
  print(numbers[2]); // Accessing 3rd Element of List
  // Update the Data of List
  numbers[3] = 50;
  print(numbers);

  // Creating an Empty List: All String Data
  List<String> names = [];
  // Add Data into List
  names.add("Pankaj");
  names.addAll(["Rahul", "Nidhi", "Manish"]);
  names.insert(1, "Amir Khan");
  names.insertAll(2, ["A", "B"]);
  print(names);

  // Remove Data from a List
  names.remove("Amir Khan");
  names.removeAt(1);
  names.removeLast();
  print(names);

  // List Properties
  print(names.length);
  print(names.first);
  print(names.last);
  print(names.isEmpty);
  print(names.isNotEmpty);

  for (int i = 0; i < names.length; i++) {
    print(names[i]);
  }

  // Using var Keyword
  var names1 = ["A", "B", "C"];
  print(names1.runtimeType);

  dynamic names2 = [10, 20, 30, "Pankaj", "Rahul", 2.5000, true, false];

  print(names2);
  print(names2.runtimeType);
}
