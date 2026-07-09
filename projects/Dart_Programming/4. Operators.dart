// Operators in Dart Programming
// 1. Arithmatic Operators
// 2. Relational Operators
// 3. Logical Operators
// 4. Assignment Operators
// 5. Conditional Operators

void main() {
  var a = 10, b = 20;
  // Arithmatic Operator
  print("Addition = ${a + b}");
  print("Subtraction= ${a - b}");
  print("Multiplication = ${a * b}");
  print("Division = ${b / a}");
  print("Integer Division = ${b ~/ a}");
  print("Modulas = ${b % a}");

  // Relation and Logical Operator operators return a boolean Value

  // Relational Operators
  print(a <= b); // true
  print(a >= b); //false
  print(a != b); // true
  print(a == b); // false

  // Logical Operators
  // AND, OR, NOT
  var c = 50;
  print(a < b && b < c); //true
  print(a < b || b < c); //true
  print(!(a < b)); //false

  // Assignment Operators
  a += 10; // a = a+10;
  b -= 5; // b = b-5
  a++;
  b--;

  // Null Saftly ?
  int? age = null;
  print(age);
  // age variable value will be either integer or null

  String? uname;
  // Testing weather we are getting any null, if yes update this with assigned value
  uname ??= "Guest";
  // ?? is an assignment in case variable as null
  print(uname);

  // conditional assignment
  c = (a < b) ? 100 : 200;
  print("Update C Value=$c");
}
