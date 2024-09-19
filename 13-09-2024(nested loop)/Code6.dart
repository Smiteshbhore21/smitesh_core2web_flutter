import 'dart:io';

void main() {
    int row = int.parse(stdin.readLineSync()!);
  int k = 1;
  for (int i = 1; i <= row; i++) {
    for (int j = 1; j <= row;) {
      if (abundant(k)) {
        stdout.write("${k++} ");
        j++;
      } else {
        k++;
      }
    }
    print("");
  }
}

bool abundant(nums) {
  int sum = 0;
  for (int i = 1; i < nums; i++) {
    if (nums % i == 0) sum += i;
  }
  if (sum > nums) return true;
  return false;
}
