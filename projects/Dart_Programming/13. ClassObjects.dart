// Class and Objects
// OOPS Principals

// Creating Class
class Student {
  // Data Members
  //  String name = "Pankaj";
  //  int age = 35;
  // String name ="";
  // int age= 0;

  String? name;
  int? age;

  double _salary = 0;
  // Constructor
  // Student(this.name, this.age);

  // Member Function
  //  void display(){
  //   print("Name: $name");
  //   print("Age: $age");
  //   print("Salary: $_salary");
  //  }

  // Getter and Setting in Dart
  double get salary => _salary;
  set salary(double amount) {
    _salary = amount;
  }
}

// Creating Objects

void main() {
  // Multiple Objects
  // Student s1 = new Student("manish", 20);
  // Student s2 = Student("Rahul", 25);

  // s1.name = "Manish";
  // s1.age = 25;

  // s2.name = "Rahul";
  // s2.age = 20;

  // s1.display();
  // s2.display();

  // getter and setter called
  Student s = new Student();
  s.salary = 10000;
  print(s.salary);
}
