/*자바의 컬렉션 framework의 map의 자식 객체중
 * properties객체는, 읽어들인 파일이 key value일경우
 * key 값을 이용하여 value를 검색할 수 있는 능력이 있따.
 * 이 실습은 json,xml등의 데이터를 보관하는 형태라면 모두 가능하다*/
package com.sds.model;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

public class Test {
	FileInputStream fis;
	Properties props;
	public Test() {
		//하드디스크 내의 메모장에 파일 인풋 스트림 생성하자
		String path="C:/jsp_workspace/MVCFramework/WebContent/WEB-INF/dispatcher-servlet.data";
		try {
			fis=new FileInputStream(path);
			props=new Properties();
			props.load(fis);
			//이 시점 부터 파일의 내용 중 키와 밸류로 이루어진 데이터 형식이라면 properties가 해석할 수 잇따.
			String value=props.getProperty("/movie.do");
			System.out.println(value);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void main(String[] args) {
		new Test();
		
	}

}
