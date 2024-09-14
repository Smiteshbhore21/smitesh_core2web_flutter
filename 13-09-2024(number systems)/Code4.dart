import 'dart:io';
import 'dart:math';

void main() {
  int nums = int.parse(stdin.readLineSync()!);
  int x = nums, power = 0;
  while (x != 0) {
    power++;
    x = x ~/ 10;
  }
  x = nums;
  int armstrong = 0;
  while (x != 0) {
    armstrong += pow(x % 10, power).toInt();
    x = x ~/ 10;
  }
  print(armstrong == nums ? "$nums is a Armstrong Number" : "$nums is not a Armstrong Number");
}
