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
		//�˸´� ����Ͻ� ���� ��ü�� �� ��Ŵ!!!
		List list=boardDAO.selectAll();
		//����� �ִٸ� ��� ����
		req.setAttribute("list", list);
		
		return "/board/view/list";
	}
	@Override
	public boolean isForward() {
		// TODO Auto-generated method stub
		return true;
	}
}
