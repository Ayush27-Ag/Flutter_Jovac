// Data Types in Dart Programming
// Supported Data Types

// 1. Numbers
// 2. Strings
// 3. Boolean
// 4. Lists -> Array
// 5. Maps -> Object

// Dart Programming is a soundly Typed Language
// Creating Data Types
void main() {
  int age = 35; // to Store an integer Value
  double height = 5.10; // to store Fraction Value
  String name = "Pankaj Kapoor"; // to Hold string value
  bool isMarried = true;
  var someData = null; // Null Type

  // $ is used to Access the variable in Dart Programming
  print("Age is: $age");
  print(age.runtimeType);

  print("Height is: $height");
  print("Name is: $name");
  print("Married ?: $isMarried");
  print("$someData");
  // value.runtimeType tells which data type bind with variable
}
