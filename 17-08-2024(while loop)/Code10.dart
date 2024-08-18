import 'dart:io';
void main(){
  int n = int.parse(stdin.readLineSync()!);
  int rev=0,rem =0;
  int temp=n;
  while(n>0){
    rem = n%10;
    rev = rem + (rev*10);
    n~/=10;
  }
  if(temp==rev)
    print("$temp is a palindrome");
  else
    print("$temp is not a palindrome");
}