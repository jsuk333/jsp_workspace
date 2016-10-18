/* ��� ��Ʈ�ѷ��� ����
 * 1. ��û�� �޴´�.
 * 2. ��û�� �м��Ѵ�.
 * 3. �˸´� �����Ͻ� ���� ��Ʈ�� �� ��Ų��.
 * 4. ����� �ִٸ� ����� �����Ѵ�.(���û���)
 * 5. ����� �˸´� �並 �����Ͽ� �����ش�.
 * 
 * */
package com.sds.mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sds.mvc.model.MovieAdvice;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

public class MovieController extends HttpServlet{
	
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//1.��û�� �޴´�.
		System.out.println("������ ��û�� �߱�");
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html");
		String movie=req.getParameter("movie");
		//2.��ȭ�� ���� �м�(����)
		//3.�˸´� ����Ͻ� ��ü�� �� ��Ų��.
		MovieAdvice movieAdvice=new MovieAdvice();
		String msg=movieAdvice.getAdvice(movie);
		//4.����� ������ �д�
		req.setAttribute("msg", msg);
		//5.�˸´� �並 �����Ͽ� ���� �ش�.
		RequestDispatcher dis=req.getRequestDispatcher("/movie/result.jsp");
		dis.forward(req, res);
		
		
	
	}
}
