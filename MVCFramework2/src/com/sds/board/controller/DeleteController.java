package com.sds.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sds.board.model.BoardDAO;
import com.sds.controller.Controller;

public class DeleteController implements Controller{
	BoardDAO boardDAO=new BoardDAO();
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		String board_id=req.getParameter("board_id");
		int result=boardDAO.delete(Integer.parseInt(board_id));
		return "/board/view/delete";
	}
	
	public boolean isForward() {
	
		return false;
	}
}
