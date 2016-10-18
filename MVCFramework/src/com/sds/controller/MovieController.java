/*웹 어플리케이션에서 컨트롤러를 오직 하나만 둘 경우
 * 모든 요청을 하나의 진입점으로 몰아버리는 처리 방식은 올바른 방식이나.. 너무
 * 많은 유형의 요청을 처리해야 하므로, 모든 요청마다 1:1 대응하는 if문 블럭이 생성된다..
 * 이 경우 , 요청이 많아질 경우 오히ㅣ려 유지보수성이  더 떨어진다.
 * 해결책) if문을--> 객체 차원으로 끌어올리자.
 * 	즉 모든 요청마다1:1 대응하는 하위 컨트롤러를 둔다.
 * 이러한 개발 방법을(패턴) 을 command pattern이라 한다. gof에 의해
 * */
package com.sds.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sds.model.MovieAdvice;
//동생 컨트롤러
public class MovieController implements Controller{
	//영화에 대한 요청 처리 메서드
	public void execute(HttpServletRequest req,HttpServletResponse res){
		//3단계:영화 처리 모델 객체에  일 시킨다.
		MovieAdvice model=new MovieAdvice();
		String movie=req.getParameter("movie");
		String msg=model.getAdvice(movie);
		//4단계 결과 저장
		req.setAttribute("msg", msg);
		//5단계 알맞는 뷰 페이지 보여주기
		RequestDispatcher dis=req.getRequestDispatcher("/movie/result.jsp");
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
