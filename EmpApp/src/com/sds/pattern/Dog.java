/*
 * 이 강아지 일반 클래스의인스턴스를 메모리에 한번만 올리도록 처리해보자, 이러한 개발 방법을 싱글턴 패턴이라고 한다.
 * GOF가 저술한 Design Pattern 이라는 책에서 붙여진 이름이다.
*/
package com.sds.pattern;

public class Dog {
	private static Dog instance;
	private Dog(){
		
	}
	public static Dog getInstance(){
		if(instance==null){
			instance=new Dog();
		}
		return instance;
	}
}
