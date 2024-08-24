import 'dart:io';
void main(){
  int product=1;
  int i=1;
  while(i<=10){
    product*=i;
    i+=2;
  }
  stdout.write(product);
}