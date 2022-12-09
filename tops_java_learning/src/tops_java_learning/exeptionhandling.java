package tops_java_learning;

import java.util.Scanner;

public class exeptionhandling{
	public static void main(String[] args) {
		int a,b;
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter A:- ");
		a=sc.nextInt();
		System.out.println("Enter B:- ");
		b=sc.nextInt();
		try {
		System.out.println("answer is="+(a/b));
		}
		catch(NException e) {
			System.out.println("exeption occured");
		}
		sc.close();
	}

}
