import "dart:io";
void main(){
  int row = int.parse(stdin.readLineSync()!);
  for(int i=0; i<row; i++){
    for(int j=0; j<row; j++){
      if(i%2==0){
        stdout.write("1 ");
      }else{
        stdout.write("0 ");
      }
    }
      
    print("");
  }
}