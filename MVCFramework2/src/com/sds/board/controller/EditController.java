package com.sds.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sds.board.domain.Board;
import com.sds.board.model.BoardDAO;
import com.sds.controller.Controller;

public class EditController implements Controller{
	BoardDAO boardDAO=new BoardDAO();
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		String board_id=req.getParameter("board_id");
		String title=req.getParameter("title");
		String writer=req.getParameter("writer");
		String content=req.getParameter("content");
		Board board=new Board();
		board.setBoard_id(Integer.parseInt(board_id));
		board.setTitle(title);
		board.setWriter(writer);
		board.setContent(content);
		req.setAttribute("board", board);
		int result=boardDAO.update(board);
		return "/board/view/edit";
	}

	@Override
	public boolean isForward() {
		return true;
	}
	
}
