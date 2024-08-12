void main(){
int x=90;
	if (x>=0 && x<=90){
		print("No charges");
	}else if (x>90 && x<=180){
		x*=6;
		print(x);
	}else if (x>180 && x<=250){
		x=x*10;
		print(x);
	}else if (x>250){
		print(x*15);
	}else{
		print("Not Valid Units");
	}

}