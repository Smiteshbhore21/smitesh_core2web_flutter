import 'dart:io';

void main() {
  int row = int.parse(stdin.readLineSync()!);
  int n = 1;
  for (int i = row; i > 0; i--) {
    for (int j = i; j < row; j++) {
      stdout.write("\t");
    }
    for (int k = 1; k <= (2 * i - 1); k++) {
      stdout.write("${n++}\t");
    }
    print("");
  }
}
