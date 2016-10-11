/*
 * Ŭ���̾�Ʈ�� ������ �� ����� �Ķ�ص��� �Ѱ� �޾Ƽ�, ����Ŭ�� �־�����
 * */
package com.sds.emp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sds.pool.PoolManager;

public class EmpRegist extends HttpServlet{
	//dml�� �μ�Ʈ���� �����ϱ� ���� jdbc��ü
	Connection con;
	PreparedStatement pstmt;
	PoolManager pool=PoolManager.getInstance();
	
	//Ŭ���̾�Ʈ�� ��û ����� post�ϰ�� �Ʒ��� �޼��尡 service�޼��忡 ���� ȣ��ȴ�.
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");
		res.setCharacterEncoding("utf-8");//��� �ѱ� �� ������
		req.setCharacterEncoding("utf-8");//�Է� �ѱ� �ȱ�����
		PrintWriter out=res.getWriter();
		//���� ��ü �뿩
		try {
			con=pool.getConnection();
			String sql="insert into emp( empno, ename ,job, mgr,hiredate, sal ,comm, deptno) ";
			sql+="values(?,?,?,?,?,?,?,?)";
			//Ŭ���̾�Ʈ�� ������ ��û �Ķ���� 
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(req.getParameter("empno")));
			pstmt.setString(2, req.getParameter("ename"));
			pstmt.setString(3, req.getParameter("job"));
			pstmt.setInt(4, Integer.parseInt(req.getParameter("mgr")));
			pstmt.setString(5, (String)req.getParameter("hiredate"));
			pstmt.setInt(6, Integer.parseInt(req.getParameter("sal")));
			pstmt.setInt(7, Integer.parseInt(req.getParameter("comm")));
			pstmt.setInt(8, Integer.parseInt(req.getParameter("deptno")));
			int result=pstmt.executeUpdate();
			if(result!=0){
				out.print("<script>");
				out.print("alert('��� ����');");
				out.print("location.href=\"/list\"");
				out.print("</script>");
			}else{
				out.print("<script>");
				out.print("alert('��� ����');");
				out.print("history.back()");
				out.print("</script>");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			pool.freeConnection(con, pstmt);
		}
		
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");
		res.setCharacterEncoding("utf-8");
		PrintWriter out=res.getWriter();
		out.println("get");
	}
}
