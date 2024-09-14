import 'dart:io';
void main(){
  int prev=0;
  int curr=0;
  int res=1;
  int nums = int.parse(stdin.readLineSync()!);
  for(int i=0; i<nums; i++){
    stdout.write("$curr ");
    prev=curr;
    curr=res;
    res=curr+prev;
  }
}