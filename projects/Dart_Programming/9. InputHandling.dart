import 'dart:io';

// void main(){
//   print("Enter your DOY:");
//   String? input = stdin.readLineSync();
//   // print("Hello $input");

//   // Type Conversion
//   var birthYearInt = int.parse(input!);
//   var age=2026-birthYearInt;
//   print(age);

// }

// Input Multiple Value
// void main(){
//   print("Enter First Number");
//   int num1 = int.parse(stdin.readLineSync()!);

//   print("Enter Second Number");
//   int num2 = int.parse(stdin.readLineSync()!);

//   print("Sum = ${num1 + num2}");

// }

// Input multiple value
// 10 20 30 40 50

void main() {
  print("Enter list of Numbers separated by a space");
  List<int> numbers = stdin
      .readLineSync()! // 10 20 30 40 50 "one String"
      .split(' ') // 10 20 30 40 50
      .map((i) => int.parse(i)) // 10 20 30 40 50 all integers
      .toList(); // List

  print(numbers);
}
