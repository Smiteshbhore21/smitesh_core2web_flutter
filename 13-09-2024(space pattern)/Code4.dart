import 'dart:io';

void main() {
  int row = int.parse(stdin.readLineSync()!);
  for (int i = 1; i <= row; i++) {
    int n = i;
    for (int j = i; j < row; j++) {
      stdout.write("\t");
    }
    for (int k = 1; k <= i; k++) {
      stdout.write("$n\t");
      n+=i;
    }
    print("");
  }
}
