void main(){
  double x=26.6;
  if(x<18.5){
    print("underweight");
  }else if(x>=18.5 && x<=24.9){
    print("normal");
  }else if(x>=25.0 && x<=29.9){
    print("Overweight");
  }
  else if(x>=30.0 && x<=34.9){
    print("Overweight");
  }else if(x>=35.0){
    print("Extreme Obese");
  }
}