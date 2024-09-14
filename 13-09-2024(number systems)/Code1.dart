import 'dart:io';
void main(){
  int nums = int.parse(stdin.readLineSync()!);
  int sum = 0;
  for(int i=1; i<nums; i++){
    if(nums%i==0) sum+=i;
  }
  print(sum==nums?"$nums is a Perfect Number":"$nums is not a Perfect Number");

}

/*
//2nd Approach//
import 'dart:io';
import 'dart:math';
void main(){
  int nums = int.parse(stdin.readLineSync()!);
  int sum = 1;
  int srt = sqrt(nums).toInt();
  for(int i=2; i<=srt; i++){
    if(nums%i==0) sum+=i + nums~/i;
  }
  print(sum==nums?"$nums is a Perfect Number":"$nums is not a Perfect Number");
}
*/