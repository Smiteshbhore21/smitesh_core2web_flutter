import 'dart:io';

void main() {
  int nums = int.parse(stdin.readLineSync()!);
  int x = nums;
  bool flag = false;
  while (x != 0) {
    if (x%10==0) flag=true;
    x ~/= 10;
  }
  print(flag?"$nums is a Duck Number":"$nums is not a Duck Number");
}
