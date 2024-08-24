import 'dart:io';
void main(){
  int i=50;
  while(i>=30){
    if(i%2==0){
      stdout.write(i);
      stdout.write(" ");
    }
    i--;
  }
}