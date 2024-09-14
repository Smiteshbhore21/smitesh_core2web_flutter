import 'dart:io';

void main() {
  int nums = int.parse(stdin.readLineSync()!);
  int count = 0;
  for(int i=1; i<=nums/2; i++){
    if(nums%i==0)
      count+=2;
  }
  print(count==2?"$nums is Prime Number":"$nums is not a Prime Number");
}