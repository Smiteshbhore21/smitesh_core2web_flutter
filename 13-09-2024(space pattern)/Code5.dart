import 'dart:io';

void main() {
  int row = int.parse(stdin.readLineSync()!);
  int n = 1;
  for (int i = 1; i <= row; i++) {
    for (int j = i; j < row; j++) {
      stdout.write("\t");
    }
    for (int k = 1; k <= i; k++) {
      stdout.write("${n * n}\t");
      n++;
    }
    print("");
  }
}
