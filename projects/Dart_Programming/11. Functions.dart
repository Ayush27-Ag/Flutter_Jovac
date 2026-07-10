import "dart:io";

void main() {
  // PrintSomthing();    // Function Call
  // print( PrintSomthingwithReturn());

  var num1 = int.parse(stdin.readLineSync()!);
  var num2 = int.parse(stdin.readLineSync()!);
  // int sum = ExecuteSum(num1, num2);
  int sum = ExecuteSumArrow(num1, num2);
  print("Sum = $sum");
  print(PrintSomthingwithReturn());
  PrintSomthing();
}

// Function Defination
void PrintSomthing() {
  print("This is a User defined Function");
  print("You can call this inside the main function");
}

String PrintSomthingwithReturn() {
  return "This function returns back to called function";
}

int ExecuteSum(int x, int y) {
  return x + y;
}

// An Arrow Function
int ExecuteSumArrow(int x, int y) => x + y;
