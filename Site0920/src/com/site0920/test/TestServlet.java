/*
	서블릿이란?? 서버에서만 해석 및 실행되는 클래스를 의미한다.
*/
package com.site0920.test;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class  TestServlet extends HttpServlet
{
		//서블릿의 생명주기 중 인스턴스의 생성시 서버의 정보를 넘겨받기 위한 과정으로, 아래의 init 호출
		//서블릿의 일생중 단 한번 호출 됨(태어난 즉시)
		//생성자와는 틀리다. 즉 생성후 호출
		//호출 시점을 비교하자면 생성자보다 늦다.
		public void init(){
			System.out.println("나 지금 막 태어났어요!!");
		}
		//생성된 servlet이 업무를 처리할때 호출 되는 메서드
		//즉, 클라이언트의 요청이 들어올때마다 호출되는 메서드...
		//service 메서드는 클라이언트의 요청을 처리해야 함으로 클라이언트가 요청시 전달한 정보를 알아야 한다.
		//request 객체, response 객체를 인수로 받는다.
		public void service(HttpServletRequest req,HttpServletResponse res){
			System.out.println("요청을 처리할게요!!");
		}
		//servlet의 인스턴스가 소멸될때 단 한번 호출 되는 메서드
		//더이상 사용하지 않을 자원등을 반납할때 유용...
		public void destroy(){
			System.out.println("저 갑니다.");
		}
}
