/*MVC������ �����Ͽ�, ���ø����̼� ������ ���\
 * ��� ����û���� 1:1 �����ϴ� ��Ʈ�ѷ��� �θ� ������ ������������ ��������...
 * ���� �� ������ �ذ� �Ϸ���, ���ø����̼� ���� ��� ��û�� ���� �ϳ��� ���������� ������, �ϳ��� ��Ʈ�ѷ��� ����ϰ� ó���ϰ� ����*/
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
	
	//������ �¾��, ���ϱ� ������ �ѹ� �ʱ�ȭ�� ȣ���
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
	//get�̴� post�̴� � ������� �������� �� �޼��忡�� �������� ������ ó������
	protected void doRequest(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//1 �ܰ�:��û�� �޴´�.
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html");
		PrintWriter out=res.getWriter();
		out.print("��û�� ��� �Գ׿�"+"<br>");
		//2�ܰ�:Ŭ���̾�Ʈ�� ��û�� �м��Ѵ�.
		String uri=req.getRequestURI();
		out.print(uri);
		Controller controller=null;
		
		
		try {
			String controllerName=props.getProperty(uri);
			Class controllerClass=Class.forName(controllerName);//Ŭ���� �ε�
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
