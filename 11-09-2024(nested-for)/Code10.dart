import 'dart:io';

void main() {
  int row = int.parse(stdin.readLineSync()!);
  int prev = 0;
  int curr = 0;
  int res = 1;
  for (int i = 1; i <= row; i++) {
    for (int j = 1; j <= i; j++) {
      stdout.write("$res\t");
      prev = curr;
      curr = res;
      res = curr + prev;
    }
    print("");
  }
}
