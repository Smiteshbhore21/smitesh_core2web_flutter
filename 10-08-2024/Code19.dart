void main(){
  int mark=100;
  if(mark>=0 && mark<25){
    print("Your grade is D");
  }else if(mark>=25 && mark<50){
    print("Your grade is C");
  }else if(mark>=50 && mark<75){
    print("Your grade is B");
  }else if(mark>=75 && mark<=100){
    print("Your grade is A");
  }else{
    print("Invalid Marks");
  }
}