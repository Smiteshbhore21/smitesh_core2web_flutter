import 'dart:io';

void main() {
  int row = int.parse(stdin.readLineSync()!);
  int k = 2, prt=0;
  for (int i = 1; i <= row; i++) {
    for (int j = 1; j <= row; j++) {
        stdout.write("$prt\t");
        prt=prt+k;
        k+=2;
    }
    print("");
  }
}
