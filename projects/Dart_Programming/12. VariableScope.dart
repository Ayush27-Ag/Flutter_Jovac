// Variable Scope
// 1. Global Scope: Variable visiblity through the program
// 2. Local Scope:  Variable visiblity inside the function block only

// Global Variable in Dart
var name = "Microsoft";

void main() {
  print("InSide Main $name");
  companyName();
}

companyName() {
  // Local Varaible, Local Scope
  var name = "Beta-Labs";
  print("My Company Name: $name");
}

// Compiler hamesha nearest scope me variable dhoondta hai.
