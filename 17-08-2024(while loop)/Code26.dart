import 'dart:io';
void main(){
  int i=20;
  while(i>=10){
    if(i%2!=0){
      stdout.write(i*i);
      stdout.write(" ");
    }
    i--;
  }
}