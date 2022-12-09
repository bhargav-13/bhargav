package tops_java_learning;

class abc{

	void fun1(){
		System.out.println("this is base class");
	}
}
	
	class abcd extends abc{
	void fun1(){
		super.fun1();
		System.out.println("this is derived class");
	}
	}		


public class superkey {
	
	public static void main(String[] args) {
		abcd a1 = new abcd();
		a1.fun1();
	}

}
