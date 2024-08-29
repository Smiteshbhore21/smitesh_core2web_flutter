import 'dart:io';

void main() {
  int row = int.parse(stdin.readLineSync()!);
  int p = 1;
  for (int i = 1; i <= row; i++) {
    p = i;
    for (int j = 1; j <= i; j++) {
      if (j % 2 == 0)
        stdout.write("${p * p++}\t");
      else
        stdout.write("${p * p * p++}\t");
    }
    print("");
  }
}
