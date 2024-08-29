import 'dart:io';

void main() {
  int row = int.parse(stdin.readLineSync()!);
  int p = row, n=1;
  for (int i = 1; i <= row; i++) {
    p = row-i+1;
    for (int j = 1; j <= i; j++) {
      if (j % 2 != 0)
        stdout.write("${p++}\t");
      else
        stdout.write("${n++}\t");
    }
    print("");
  }
}
