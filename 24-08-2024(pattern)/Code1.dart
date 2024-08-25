import "dart:io";
void main(){
  int row = int.parse(stdin.readLineSync()!);
  int k=1;
  for(int i=0; i<row; i++){
    for(int j=0; j<row; j++)
      stdout.write("${k++} ");
    print("");
  }
}