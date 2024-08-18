import 'dart:io';
void  main(){
  int day = int.parse(stdin.readLineSync()!);
  if(day<=0)
    print("$day days assignment is overdue");
  else{
    while(day>=1){
      print("$day days remaining");
      day--;
    }
    print("$day days assignment is overdue");
  }
}