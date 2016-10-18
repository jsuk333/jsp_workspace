/*상세보기 요청을 처리하는 동생 컨트롤러*/
package com.sds.board.controller;

import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sds.board.domain.Board;
import com.sds.board.model.BoardDAO;
import com.sds.controller.Controller;

public class DetailController implements Controller{
	BoardDAO boardDAO=new BoardDAO();
	//알맞는 비즈니스 로직 객체에 일 시키기
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		int board_id=Integer.parseInt(req.getParameter("board_id"));
		Board board=boardDAO.selectOne(board_id);
		//4단계 뷰페이지로 갈 결과를 메모리에 심기
		req.setAttribute("board", board);
		//5단계 알맞는 뷰에 전송
		return "/board/view/detail";
	}
	@Override
	public boolean isForward() {
		return true;//요청을 유지하자
	}
}
