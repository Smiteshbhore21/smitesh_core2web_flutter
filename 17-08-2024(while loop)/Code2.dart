import "dart:io";
void main(){
  int n = int.parse(stdin.readLineSync()!), temp=n;
  while(n>=1){
    if(temp%2==0)
      print(n--);
    else{
      print(n);
      n-=2;
      }
  }
}