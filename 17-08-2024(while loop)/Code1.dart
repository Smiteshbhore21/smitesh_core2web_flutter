void main(){
  int i=1, sum =0, multi =1;
  while(i<=10){
    if(i%2==0){
      sum+=i++;
    }
    else multi*=i++;
  }
  print("$sum");
  print("$multi");
}