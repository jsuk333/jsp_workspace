/*�� 2 ��Ŀ����� Ŭ���̾�Ʈ�� ��� ��û�� �ϳ��� �������� �ΰ� ó���Ѵ�.
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
		ServletContext application=config.getServletContext();//���ø����̼��� ������ ������ ��� �մ� ��ü
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
		//�Ķ���� ���ڵ� ó��
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html");
		resp.setCharacterEncoding("utf-8");
		//2�ܰ� ��û�� �м��Ѵ�.
		PrintWriter out=resp.getWriter();//Ŭ���̾�Ʈ�� ��û�� uri
		//�츮�� ���⿡ ���� ���ϴ� �� ������ �ɾ���.
		String uri=req.getRequestURI();
		String className=props.getProperty(uri);
		
		try {
			Class controllerClass=Class.forName(className);
			Controller controller=(Controller)controllerClass.newInstance();
			String viewKey=controller.execute(req, resp);
			//������Ʈ�ѿ��� 3,4�ܰ��� ������ ��Ų�� ��� �������� ������ �ǹ��� ���Կ��� �ִ�.
			//5�ܰ� �˸´� ���������� ������.
			String viewPage=props.getProperty(viewKey);
			//���� or ����
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
