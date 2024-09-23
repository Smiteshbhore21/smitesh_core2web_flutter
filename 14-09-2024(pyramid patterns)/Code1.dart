import 'dart:io';

void main() {
  int row = int.parse(stdin.readLineSync()!);
  for (int i = 1; i <= row; i++) {
    for (int j = i; j < row; j++) {
      stdout.write("\t");
    }
    for (int k = 1; k <= (2 * i - 1); k++) {
      stdout.write("*\t");
    }
    print("");
  }
}
