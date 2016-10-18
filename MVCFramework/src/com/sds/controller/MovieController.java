/*�� ���ø����̼ǿ��� ��Ʈ�ѷ��� ���� �ϳ��� �� ���
 * ��� ��û�� �ϳ��� ���������� ���ƹ����� ó�� ����� �ùٸ� ����̳�.. �ʹ�
 * ���� ������ ��û�� ó���ؾ� �ϹǷ�, ��� ��û���� 1:1 �����ϴ� if�� ���� �����ȴ�..
 * �� ��� , ��û�� ������ ��� �����ӷ� ������������  �� ��������.
 * �ذ�å) if����--> ��ü �������� ����ø���.
 * 	�� ��� ��û����1:1 �����ϴ� ���� ��Ʈ�ѷ��� �д�.
 * �̷��� ���� �����(����) �� command pattern�̶� �Ѵ�. gof�� ����
 * */
package com.sds.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sds.model.MovieAdvice;
//���� ��Ʈ�ѷ�
public class MovieController implements Controller{
	//��ȭ�� ���� ��û ó�� �޼���
	public void execute(HttpServletRequest req,HttpServletResponse res){
		//3�ܰ�:��ȭ ó�� �� ��ü��  �� ��Ų��.
		MovieAdvice model=new MovieAdvice();
		String movie=req.getParameter("movie");
		String msg=model.getAdvice(movie);
		//4�ܰ� ��� ����
		req.setAttribute("msg", msg);
		//5�ܰ� �˸´� �� ������ �����ֱ�
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
