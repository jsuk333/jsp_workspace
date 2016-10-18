package com.sds.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sds.board.domain.Board;
import com.sds.board.model.BoardDAO;
import com.sds.controller.Controller;
import com.sds.controller.DispatcherServlet;

public class WriteController implements Controller{
	//3�ܰ� �˸´� ����Ͻ� ���� ��ü���� �� ��Ų��.
	
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		BoardDAO boardDAO=new BoardDAO();
		Board board=new Board();
		String title=req.getParameter("title");
		String writer=req.getParameter("writer");
		String content=req.getParameter("content");
		board.setTitle(title);
		board.setWriter(writer);
		board.setContent(content);
		int result=boardDAO.insert(board);
		//4�ܰ� : ����
		
		
		return "/board/view/write";
	}
	@Override
	public boolean isForward() {
		return false;
	}
}
