// Dart Programming Five Different loops
// 1. for loop: When you know number of Iteration
// 2. while loop: When we check the condition before Execution
// 3. do while loop: When u need to execute your loop atleast before the condition
// 4. for-in() loop: When data is already given
// forEach(): Used to iterate over every element of a collection (List, Map, Set)
// It executes a callback function once for each element.

// 1. for loop

// void main(){
//   for (int i=1;i<=10;i++)
//     print(i);
// }

// 2. While loop

// void main(){
//   int i=1;
//   while(i<=10)
//   {
//     if (i==5)
//    {
//     i++;
//     continue;}

//     print(i);
//     i++;
//   }
// }

// 3. do-while loop

// void main(){
//   int i =1;
//   do {
//     print (i);
//     i++;
//   }while (i>10);
// }

// 4. for in Loop

// void main(){
//   var numbers = [10,20,30,40];
//   int sum = 0;
//   for (int i in numbers){
//       sum += i;
//   }
//   print(sum);
// }

// 5. foreach loop

// void main(){
//   var numbers = [10,20,30,40];
//   int sum = 0;
//   numbers.forEach((num)=> sum+=num );

//   print(sum);
// }

// void main() {
//   Map<String, int> marks = {"Math": 90, "English": 70, "Computer": 95};

//   for (var entry in marks.entries) {
//     print("${entry.key} : ${entry.value}");
//   };
// }

void main() {
  Map<String, int> marks = {"Math": 90, "English": 70, "Computer": 95};

  marks.forEach((subject, score) => print("$subject: $score"));
}
