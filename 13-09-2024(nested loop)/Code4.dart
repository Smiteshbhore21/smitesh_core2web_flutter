//NOT Working
import 'dart:io';

void main() {
  int row = int.parse(stdin.readLineSync()!);
  int k = 1;
  for (int i = 1; i <= row; i++) {
    for (int j = 1; j <= row; j++) {
      String binary = k.toRadixString(2);
      stdout.write("$binary ");
      k++;
    }
    print("");
  }
}