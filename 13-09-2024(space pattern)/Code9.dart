import 'dart:io';

void main() {
  int row = int.parse(stdin.readLineSync()!);
  int n = (row*row)+row;
  for (int i = row; i >= 1; i--) {
    for (int j = i; j < row; j++) {
      stdout.write("\t");
    }
    for (int k = 1; k <= i; k++) {
      stdout.write("$n\t");
      n-=2;
    }
    print("");
  }
}