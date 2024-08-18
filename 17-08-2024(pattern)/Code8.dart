import "dart:io";
void main(){
  int nums=0;
  int row = int.parse(stdin.readLineSync()!);
  for(int i=0; i<row; i++){
    nums=i+1;
    for(int j=0; j<row; j++){
      stdout.write("${nums++}   ");
    }
    print("");
  }
}