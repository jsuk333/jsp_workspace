/*
 * 클라이언트가 전소한 폼 양식의 파라밑들을 넘겨 받아서, 오라클에 넣어주자
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
	//dml중 인서트문을 수행하기 위한 jdbc객체
	Connection con;
	PreparedStatement pstmt;
	PoolManager pool=PoolManager.getInstance();
	
	//클라이언트의 요청 방식이 post일경우 아래의 메서드가 service메서드에 의해 호출된다.
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");
		res.setCharacterEncoding("utf-8");//출력 한글 안 깨지게
		req.setCharacterEncoding("utf-8");//입력 한글 안깨지게
		PrintWriter out=res.getWriter();
		//접속 객체 대여
		try {
			con=pool.getConnection();
			String sql="insert into emp( empno, ename ,job, mgr,hiredate, sal ,comm, deptno) ";
			sql+="values(?,?,?,?,?,?,?,?)";
			//클라이언트가 전송한 요청 파라미터 
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
				out.print("alert('등록 성공');");
				out.print("location.href=\"/list\"");
				out.print("</script>");
			}else{
				out.print("<script>");
				out.print("alert('등록 실패');");
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
