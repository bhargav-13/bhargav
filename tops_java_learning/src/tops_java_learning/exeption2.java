package tops_java_learning;

import java.util.Scanner;

public class exeption2 {
	public static void demo() throws Exception 
	{
		int x;
		Scanner sc = new Scanner(System.in);
		System.out.print("enter number: ");
		x= sc.nextInt();
		
		if(x>0) {
			System.out.println("cube of "+x+ " is " +(x*x*x));
		}
		else {
			throw new Exception();
		}
		demo();
		
	}
 
	public static void main(String[] args) {
		try {
			demo();
		}
		catch(Exception e) {
			System.out.println("exception name is :" +e);
			System.out.println("enter positive values only");
		}
	}
} 

