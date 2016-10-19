package com.sds.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sds.board.model.ReBoardDAO;
import com.sds.controller.Controller;

public class ListController implements Controller{

	ReBoardDAO dao=new ReBoardDAO();
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		List list=dao.selectAll();
		req.setAttribute("list", list);
		return "/reboard/view/list";
	}

	
	public boolean isForward() {
	
		return true;
	}
	
}
