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

import com.sds.mvc.model.MovieAdvice;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

public class MovieController extends HttpServlet{
	
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//1.요청을 받는다.
		System.out.println("누군가 요청을 했군");
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html");
		String movie=req.getParameter("movie");
		//2.영화에 대한 분석(생략)
		//3.알맞는 비즈니스 객체에 일 시킨다.
		MovieAdvice movieAdvice=new MovieAdvice();
		String msg=movieAdvice.getAdvice(movie);
		//4.결과를 저장해 둔다
		req.setAttribute("msg", msg);
		//5.알맞는 뷰를 선택하여 보여 준다.
		RequestDispatcher dis=req.getRequestDispatcher("/movie/result.jsp");
		dis.forward(req, res);
		
		
	
	}
}
