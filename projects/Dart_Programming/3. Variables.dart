// Dart is Soundly typed Language
void main() {
  String name = "Pankaj";
  // "Pankaj" value is stored in a variable name "name" and it is of type String
  print(name);
  // Type checking is enabled at compile time
  var myName = "Rahul"; // Variable Declaration
  myName = 2.5 as String; // Variable Assignment
  print(myName);

  print(myName.runtimeType);

  // Dynamic disable the type checking
  dynamic myusername = "ABC";
  myusername = 123;
  print(myusername);

  // const Identifier compile time
  const pi = 3.14;
  print(pi);

  // final define data only runtime
  var myName1;
  myName1 = "Pankaj Kapoor";
  myName1 = "Rahul";
  print(myName1);
}
