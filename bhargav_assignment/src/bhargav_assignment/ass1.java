package bhargav_assignment;

import java.util.Scanner;

public class ass1 {
	
	public static void main(String[] args) {
		int a,b,c;
		Scanner sc= new Scanner(System.in);
		
		System.out.println("enter 1st number:");
		a=sc.nextInt();
	    System.out.println("enter 2nd numbr:");
	    b=sc.nextInt();
	    System.out.println("enter 3rd number:");
	    c=sc.nextInt();
	    
	    if(a>b && a>c) {
	    	System.out.println(a+" is bigger");
	    }
	    else if( b>c) {
	    	System.out.println(b+ " is bigger");
	    }
	    else {
	    	System.out.println(c+ " is bigger");
	    }
	}
	

}
