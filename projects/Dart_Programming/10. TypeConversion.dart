import 'dart:io';

void main() {
  String input = "123.05";
  var num = stdin.readByteSync();
  print((double.parse(input)).runtimeType);
  print(input);
  print(num.runtimeType);
  print((num.toDouble()).runtimeType);
}
