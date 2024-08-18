import 'dart:io';
void main(){
  int n = int.parse(stdin.readLineSync()!);
  int count =0;
  while(n>0){
    n=n~/10;
    count++;
  }
  print("Count of digits = $count");
}