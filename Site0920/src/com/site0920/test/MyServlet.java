/*
	개발자의 의도와 상관 없이, 클라이언트가 브라우저로 접근할때 서버에서 실행되는 클래스가
	되려면 반드시 서블릿이라는 javaEE의 api에서 지원하는 클래스를 상속받아야 한다!!
	즉, 서블릿이란? 서버에서 실행되는 자바의 클래스
*/
package com.site0920.test;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import java.io.IOException;
import java.io.PrintWriter;
public class  MyServlet extends HttpServlet{
	// 개발자가 현재 클래스를 서블릿으로 정의 할 경우 , 이 시점 부터 
	//이 클래스는 서버측에서 실행될 수 있는 클래스가 된다.
	//따라서 클라이언트가 브라우저로 접근할때 실행 된다.
	//클라이언트가 get방식으로 접근할 경우 아래의 메서드가 실행 된다.
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		//브라우저의 문자열을 출력해 보자
		PrintWriter out=response.getWriter();
		out.print("<table width=\"width=200px border=1px\">");
		for(int i=1;i<=10;i++){
			out.print("<tr>");
			for(int j=1;j<=2;j++){
				out.print("<td>");
				out.print(11-i+"0"+j);
				out.print("</td>");
			}
			out.print("<tr>");
		}
		out.print("</table>");
	}
}
