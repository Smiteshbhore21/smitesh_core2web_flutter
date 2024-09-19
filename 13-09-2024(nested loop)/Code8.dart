import 'dart:io';

void main() {
  int row = int.parse(stdin.readLineSync()!);
  int k=1;
  for (int i = 1; i <= row; i++) {
    for (int j = 1; j <= row; j++) {
        if(k%6==0)  k++;
        stdout.write("$k\t");
        k++;
    }
    print("");
  }
}
