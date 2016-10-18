package com.sds.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sds.board.model.BoardDAO;
import com.sds.controller.Controller;

public class ListController implements Controller {
	BoardDAO boardDAO=new BoardDAO();
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		//알맞는 비즈니스 로직 객체에 일 시킴!!!
		List list=boardDAO.selectAll();
		//결과가 있다면 결과 저장
		req.setAttribute("list", list);
		
		return "/board/view/list";
	}
	@Override
	public boolean isForward() {
		// TODO Auto-generated method stub
		return true;
	}
}
