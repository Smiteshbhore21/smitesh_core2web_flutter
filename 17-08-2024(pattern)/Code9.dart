import "dart:io";
void main(){
  int nums=2;
  int row = int.parse(stdin.readLineSync()!);
  for(int i=0; i<row; i++){
    nums--;
    for(int j=0; j<row; j++){
      stdout.write("${nums++}   ");
    }
    print("");
  }
}