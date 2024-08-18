import 'dart:io';
void main(){
  int n = int.parse(stdin.readLineSync()!);
  int evencount =0 ,rem =0;
  while(n>0){
    rem = n%10;
    if(rem%2==0)
      evencount++;
    n~/=10;
  }
  print("Odd count in digit = $evencount");
}