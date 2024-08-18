import "dart:io";
void main(){
  int row = int.parse(stdin.readLineSync()!);
  int nums=1;
  for(int i=0; i<row; i++){
    for(int j=0; j<row; j++){
      stdout.write("$nums   ");
      nums+=2;
    }
    print("");
  }
}