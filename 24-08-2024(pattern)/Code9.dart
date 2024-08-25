import "dart:io";

void main() {
  int row = int.parse(stdin.readLineSync()!);
  int k = 2;
  for (int i = 1; i <= row; i++) {
    k = 2;
    for (int j = 1; j <= row; j++) {
      if (j != 1 && j != row) {
        stdout.write("${k++} ");
      } else if ((i + j) % 2 == 0) {
        stdout.write("1 ");
      } else {
        stdout.write("$row ");
      }
    }
    print("");
  }
}
