package com.fashion.common.file;

public class FileManager {
	//확장자 추출하기!!
	//매개변수로 파일경로를 넘기면, 확장자를 반환해주는 메서드!
	//c:/test/aa.acc..a.jpg
	public static String getExt(String path){
		return path.substring(path.lastIndexOf(".")+1 , path.length());
	}
}
