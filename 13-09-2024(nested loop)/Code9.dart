import 'dart:io';


void main() {
  int row = int.parse(stdin.readLineSync()!);
  int k = 1;
  for (int i = 1; i <= row; i++) {
    for (int j = 1; j <= row;) {
      if (Harshad(k)) {
        stdout.write("${k++} ");
        j++;
      } else {
        k++;
      }
    }
    print("");
  }
}

bool Harshad(nums) {
  int x = nums;
  int digiSum = 0;
  while (x != 0) {
    digiSum += x % 10;
    x ~/= 10;
  }
  if (nums % digiSum == 0) return true;
  return false;
}