import "dart:io";
void main(){
  int row = int.parse(stdin.readLineSync()!);
  for(int i=row; i>0; i--){
    for(int j=0; j<row; j++)
      stdout.write("${i} ");
    print("");
  }
}