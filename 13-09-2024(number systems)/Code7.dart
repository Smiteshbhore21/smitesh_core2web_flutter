import 'dart:io';
void main(){
  int nums = int.parse(stdin.readLineSync()!);
  int sum = 0;
  for(int i=1; i<nums; i++){
    if(nums%i==0) sum+=i;
  }
  print(sum>nums?"$nums is a Abundant Number":"$nums is not a Abundant Number");
}