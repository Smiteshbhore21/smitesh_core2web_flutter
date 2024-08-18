import 'dart:io';
void main(){
  int n = int.parse(stdin.readLineSync()!);
  int fact=1;
  while(n>=1){
    fact*=n;
    n--;
  }
  print(fact);
}