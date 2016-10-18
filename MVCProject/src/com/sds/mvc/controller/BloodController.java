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

import com.sds.mvc.model.BloodAdvice;
import com.sds.mvc.model.MovieAdvice;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

public class BloodController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//1.��û�� �޴´�.
		req.setCharacterEncoding("utf-8");
		String blood=req.getParameter("blood");
		//2.��û�� �м���
		//3.�� ��û�� ó���� �˸��� ����Ͻ� ������ ��Ų��.
		BloodAdvice bloodAdvice=new BloodAdvice();
		String msg=bloodAdvice.getAdvice(blood);
		//4.��� �������� ������ ������� �ִٸ� , ����� �����Ѵ�.
		req.setAttribute("msg", msg);
		//5.�˸´� �� ������ �����ֱ�
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html");
		RequestDispatcher dis=req.getRequestDispatcher("/blood/result.jsp");
		dis.forward(req, res);
	}
}
