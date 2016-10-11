package com.sds.pattern;

public class UseDog {

	public static void main(String[] args) {
		Dog d1=Dog.getInstance();
		System.out.println(d1);
		Dog d2=Dog.getInstance();
		System.out.println(d2);
		
	}

}
