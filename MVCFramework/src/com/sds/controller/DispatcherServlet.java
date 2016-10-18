/*MVC패턴을 적용하여, 어플리케이션 개발할 경우\
 * 모든 ㅇ요청마다 1:1 대응하는 컨트롤러를 두면 오히려 유지보수성이 떨어진다...
 * 따라서 이 문제를 해결 하려면, 어플리케이션 내의 모든 요청은 오직 하나의 진입점으로 몰아져, 하나의 컨트롤러가 담당하게 처리하게 하자*/
package com.sds.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sds.model.BloodAdvice;
import com.sds.model.MovieAdvice;

public class DispatcherServlet extends HttpServlet {
	FileInputStream fis;
	Properties props;
	
	//서블릿이 태어나서, 일하기 직전에 한번 초기화시 호출됨
	public void init(ServletConfig config) throws ServletException {
		ServletContext context=config.getServletContext();
		String realPath=context.getRealPath("/WEB-INF/dispatcher-servlet.data");
		try {
			fis=new FileInputStream(realPath);
			props=new Properties();
			props.load(fis);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doRequest(req, res);
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doRequest(req, res);
	}
	//get이던 post이던 어떤 방식으로 들어오던지 이 메서드에서 실제적인 로직을 처리하자
	protected void doRequest(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//1 단계:요청을 받는다.
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html");
		PrintWriter out=res.getWriter();
		out.print("요청이 들어 왔네요"+"<br>");
		//2단계:클라이언트의 요청을 분석한다.
		String uri=req.getRequestURI();
		out.print(uri);
		Controller controller=null;
		
		
		try {
			String controllerName=props.getProperty(uri);
			Class controllerClass=Class.forName(controllerName);//클래스 로드
			controller=(Controller)controllerClass.newInstance();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
		
		controller.execute(req,res);
	}
}
