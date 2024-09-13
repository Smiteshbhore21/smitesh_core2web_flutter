import 'dart:io';
void main(){
  int row = int.parse(stdin.readLineSync()!);
  for(int i=1; i<=row; i++){
    int k=row;
    for(int j=1; j<=i; j++){
      stdout.write("$k\t");
      k+=row;
    }
    print("");
  }
}