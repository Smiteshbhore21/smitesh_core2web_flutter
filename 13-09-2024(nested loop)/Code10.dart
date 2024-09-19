import 'dart:io';
import 'dart:math';

void main() {
  int row = int.parse(stdin.readLineSync()!);
  int k = 1;
  for (int i = 1; i <= row; i++) {
    for (int j = 1; j <= row;) {
      if (happyNum(k)) {
        stdout.write("${k++} ");
        j++;
      } else {
        k++;
      }
    }
    print("");
  }
}

bool happyNum(int n) {
  int sum = 0;
  while (n != 0) {
    sum += pow(n % 10, 2).toInt();
    n ~/= 10;
  }
  if (sum == 1) return true;
  if (sum >= 10) return happyNum(sum);
  return false;
}
