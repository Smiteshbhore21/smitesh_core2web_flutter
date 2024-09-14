import 'dart:io';

void main() {
  int nums = int.parse(stdin.readLineSync()!);
  int x = nums;
  int strong = 0;
  while (x != 0) {
    strong += fact(x % 10);
    x = x ~/ 10;
  }
  print(strong == nums ? "$nums is a Strong Number" : "$nums is not a Strong Number");
}

int fact(int nums) {
  int fact = 1;

  for (int i = 1; i <= nums; i++) fact *= i;

  return fact;
}
