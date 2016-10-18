/*모델 2 방식에서는 클라이언트의 모든 요청은 하나의 진입점을 두고 처리한다.
 * 
 * */
package com.sds.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URI;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Request;
public class DispatcherServlet extends HttpServlet {
	Properties props;
	FileInputStream fis;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		ServletContext application=config.getServletContext();//어플리케이션의 전역적 정보를 담고 잇는 객체
		String mapping=config.getInitParameter("mapping");
		String realPath=application.getRealPath(mapping);
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
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doRequest(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doRequest(req, resp);
	}
	protected void doRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//파라미터 인코딩 처리
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html");
		resp.setCharacterEncoding("utf-8");
		//2단계 요청을 분석한다.
		PrintWriter out=resp.getWriter();//클라이언트가 요청한 uri
		//우리는 여기에 무얼 원하는 지 정보를 심었다.
		String uri=req.getRequestURI();
		String className=props.getProperty(uri);
		
		try {
			Class controllerClass=Class.forName(className);
			Controller controller=(Controller)controllerClass.newInstance();
			String viewKey=controller.execute(req, resp);
			//동생컨트롤에게 3,4단계의 업무를 시킨후 결과 페이지를 보여줄 의무는 형님에게 있다.
			//5단계 알맞는 뷰페이지로 보낸다.
			String viewPage=props.getProperty(viewKey);
			//유지 or 끊어
			if(controller.isForward()){
				RequestDispatcher dis=req.getRequestDispatcher(viewPage);
				dis.forward(req, resp);
			}else{
				resp.sendRedirect(viewPage);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
		
		
	}
	@Override
	public void destroy() {
		if(fis!=null){
			try {
				fis.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
