<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String saveDir="C:/jsp_workspace/App0923/WebContent/data";
	int maxSize=1024*1024*2;
	//생성시 업로드 실행
	MultipartRequest multi=new MultipartRequest(request,saveDir,maxSize,"utf-8");
	String filename=multi.getOriginalFileName("myFile");
	
	
	//upload된 파라미터 및  파일에 대한 정보 출력
	out.print("파일 설명 : "+multi.getParameter("msg")+"<br>");
	out.print("파일 이름 : "+multi.getOriginalFileName("myFile"));
	//파일명을 바꿔보자
	//이미 업로드 된 파일에 대한 인스턴스 얻기
	File file=multi.getFile("myFile");
	boolean result=file.renameTo(new File(saveDir+"/"+multi.getParameter("msg")+"."+filename.substring(filename.lastIndexOf('.')+1, filename.length())));
	if(result){
		out.print("변경성공");
	}else{
		out.print("변경실패");
	}
%>