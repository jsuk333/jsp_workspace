package com.sds.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sds.model.BloodAdvice;

public class BloodController implements Controller{
	public void execute(HttpServletRequest req,HttpServletResponse res){
		//3�ܰ�:���� ó�� �� ��ü��  �� ��Ų��.
		BloodAdvice model=new BloodAdvice();
		String blood=req.getParameter("blood");
		String msg=model.getAdvice(blood);
		//4�ܰ� ��� ����
		req.setAttribute("msg", msg);
		//5�ܰ� �˸´� �� ������ �����ֱ�
		RequestDispatcher dis=req.getRequestDispatcher("/blood/result.jsp");
		try {
			dis.forward(req, res);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
