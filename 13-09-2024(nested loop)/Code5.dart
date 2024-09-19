import 'dart:io';

void main() {
  int row = int.parse(stdin.readLineSync()!);
  for (int i = 1; i <= row; i++) {
    int k = i;
    for (int j = 1; j <= row; j++) {
        stdout.write("$k\t");
        k++;
        if(k>row) k=1;
    }
    print("");
  }
}
