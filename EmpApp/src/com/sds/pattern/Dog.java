/*
 * �� ������ �Ϲ� Ŭ�������ν��Ͻ��� �޸𸮿� �ѹ��� �ø����� ó���غ���, �̷��� ���� ����� �̱��� �����̶�� �Ѵ�.
 * GOF�� ������ Design Pattern �̶�� å���� �ٿ��� �̸��̴�.
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