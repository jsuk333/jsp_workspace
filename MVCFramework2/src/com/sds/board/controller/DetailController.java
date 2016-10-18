/*�󼼺��� ��û�� ó���ϴ� ���� ��Ʈ�ѷ�*/
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
	//�˸´� ����Ͻ� ���� ��ü�� �� ��Ű��
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		int board_id=Integer.parseInt(req.getParameter("board_id"));
		Board board=boardDAO.selectOne(board_id);
		//4�ܰ� ���������� �� ����� �޸𸮿� �ɱ�
		req.setAttribute("board", board);
		//5�ܰ� �˸´� �信 ����
		return "/board/view/detail";
	}
	@Override
	public boolean isForward() {
		return true;//��û�� ��������
	}
}
