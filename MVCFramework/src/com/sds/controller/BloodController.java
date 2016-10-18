package com.sds.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sds.model.BloodAdvice;

public class BloodController implements Controller{
	public void execute(HttpServletRequest req,HttpServletResponse res){
		//3단계:혈액 처리 모델 객체에  일 시킨다.
		BloodAdvice model=new BloodAdvice();
		String blood=req.getParameter("blood");
		String msg=model.getAdvice(blood);
		//4단계 결과 저장
		req.setAttribute("msg", msg);
		//5단계 알맞는 뷰 페이지 보여주기
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
