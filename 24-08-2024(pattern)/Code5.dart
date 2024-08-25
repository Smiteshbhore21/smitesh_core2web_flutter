import "dart:io";
void main(){
  int row = int.parse(stdin.readLineSync()!);
  for(int i=1; i<=row; i++){
    int k=(i*2)-1;
    for(int j=1; j<=row; j++){
        stdout.write("${k} ");
        k+=2;
    }
    print("");
  }
}