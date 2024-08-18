import 'dart:io';
void main(){
  int n = int.parse(stdin.readLineSync()!);
  int oddcount =0 ,rem =0;
  while(n>0){
    rem = n%10;
    if(rem%2!=0)
      oddcount++;
    n~/=10;
  }
  print("Odd count in digit = $oddcount");
}