import 'dart:io';

void main() {
  int nums = int.parse(stdin.readLineSync()!);
  int x = nums;
  int revNums = 0;
  while (x != 0) {
    revNums = revNums * 10 + (x % 10);
    x ~/= 10;
  }
  print(revNums == nums ? "$nums is a Palindrome Number" : "$nums is not a Palindrome Number");
}
