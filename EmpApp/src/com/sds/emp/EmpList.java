package com.sds.emp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sds.pool.PoolManager;

public class EmpList extends HttpServlet {
	PoolManager pool=PoolManager.getInstance();
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	//Ŭ���̾�Ʈ�� �� ������� ��û�� ��� �Ʒ��� �޼��尡 ȣ�� �ȴ�.
	//service �޼��忡 ���ؼ�
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");
		res.setCharacterEncoding("utf-8");
		//oracle�����Ͽ� db��������
		
		try {
			con=pool.getConnection();//Ŀ�ؼ� Ǯ�� ���ִ� Ŀ�ؼ��� �ϳ��� ���Ƿ� �Ѱ� �޴´�.
			String sql="select * from emp";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PrintWriter out=res.getWriter();
		out.print("<script>");
		out.print("function regist(){");
		out.print("location.href=\"/emp/registForm.jsp\"");
		out.println("}");
		out.print("</script>");
		out.print("<table align=\"center\" width=\"800px\" border=\"1px\">");
		out.print("<tr align=\"center\" >");
		out.print("<td>EMPNO</td>");
		out.print("<td>ENAME</td>");
		out.print("<td>JOB</td>");
		out.print("<td>MGR</td>");
		out.print("<td>HIREDATE</td>");
		out.print("<td>SAL</td>");
		out.print("<td>COMM</td>");
		out.print("<td>DEPTNO</td>");
		out.print("</tr>");
		try {
			while(rs.next()){
				int empno=rs.getInt("empno");
				String ename=rs.getString("ename");
				String job=rs.getString("job");
				int mgr=rs.getInt("mgr");
				String hiredate=rs.getString("hiredate");
				int sal=rs.getInt("sal");
				int comm=rs.getInt("comm");
				int deptno=rs.getInt("deptno");
				out.print("<tr align=\"center\"onMouseOver=\"this.style.background='yellow'\" onMouseOut=\"this.style.background='white'\">");
				out.print("<td>"+empno+"</td>");
				out.print("<td><a href=\"/emp/detail.jsp?empno="+empno+"&ename="+ename
						+"&job="+job+"&mgr="+mgr+"&hiredate="+hiredate
						+"&sal="+sal+"&comm="+comm+"&deptno="+deptno+"\">"+ename+"</a></td>");
				out.print("<td>"+job+"</td>");
				out.print("<td>"+mgr+"</td>");
				out.print("<td>"+hiredate+"</td>");
				out.print("<td>"+sal+"</td>");
				out.print("<td>"+comm+"</td>");
				out.print("<td>"+deptno+"</td>");
				out.print("</tr>");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			//�ٽ� Ŀ�ؼ� Ǯ�� ���� ����
			pool.freeConnection(con, pstmt, rs);
		}
		
		//���� ��ü�κ��� ��Ʈ���� ���� ��, �� ��Ʈ���� ���� 
		//���� �������� �����Ͽ� ����
		out.print("<tr align=\"center\">");
		out.print("<td colspan=\"8\"align=\"right\">");
		out.print("<input type=\"button\" value=\"���\" onClick=\"regist()\">");
		out.print("</td>");
		out.print("</tr>");
		out.print("</table>");
		
		
	
	}
}
