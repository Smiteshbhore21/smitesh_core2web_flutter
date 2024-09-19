import 'dart:io';

void main() {
  int row = int.parse(stdin.readLineSync()!);
  int oddNum = 1;
  for (int i = 1; i <= row; i++) {
    int k = row - i + 1;
    for (int j = 1; j <= row; j++) {
      if (j % 2 != 0)
        stdout.write("$k\t");
      else {
        stdout.write("${k + oddNum}\t");
        k = 1 + j * row + (row - i);
      }
    }
    oddNum += 2;
    print("");
  }
}
