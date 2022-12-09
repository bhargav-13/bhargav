package tops_java_learning;

import java.util.Scanner;

class oop{
	
	Scanner sc = new Scanner(System.in);
	public int a,b;
	
	public void getdata() {
		System.out.print("Enter number A:");
		a=sc.nextInt();
		System.out.print("Enter number B:");
		b=sc.nextInt();
		}
	public void givedata() {
		System.out.println("Answer is = "+(a+b));
	}
}

public class object_oriented {
	public static void main(String[] args) {
		oop o1=new oop();
		o1.getdata();
		o1.givedata();
		
	}
	

}
