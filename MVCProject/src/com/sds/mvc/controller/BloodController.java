/* 모든 컨트롤러의 역할
 * 1. 요청을 받는다.
 * 2. 요청을 분석한다.
 * 3. 알맞는 비지니스 로직 파트에 일 시킨다.
 * 4. 결과가 있다면 결과를 저장한다.(선택사항)
 * 5. 결과를 알맞는 뷰를 선태하여 보여준다.
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
		//1.요청을 받는다.
		req.setCharacterEncoding("utf-8");
		String blood=req.getParameter("blood");
		//2.요청을 분석해
		//3.이 요청을 처리할 알맞은 비즈니스 로직에 시킨다.
		BloodAdvice bloodAdvice=new BloodAdvice();
		String msg=bloodAdvice.getAdvice(blood);
		//4.결과 페이지로 가져갈 결과물이 있다면 , 결과를 저장한다.
		req.setAttribute("msg", msg);
		//5.알맞는 뷰 페이지 보여주기
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html");
		RequestDispatcher dis=req.getRequestDispatcher("/blood/result.jsp");
		dis.forward(req, res);
	}
}
