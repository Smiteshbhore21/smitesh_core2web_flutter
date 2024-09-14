import 'dart:io';

void main() {
  int nums = int.parse(stdin.readLineSync()!);
  int x = nums;
  int digiSum = 0;
  while (x != 0) {
    digiSum += x % 10;
    x ~/= 10;
  }
  print(nums % digiSum == 0 ? "$nums is a Harshad Number" : "$nums is not a Harshad Number");
}