<%@page import="com.fashion.emp.Dept"%>
<%@page import="com.fashion.emp.Emp"%>
<%@page import="java.util.List"%>
<%@page import="com.fashion.emp.DeptDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	DeptDAO dao=new DeptDAO();
%>
<%
	List list=dao.selectAll();
	
%>
<table width="100%" border="1px black">
	<tr>
		<td>deptno</td>
		<td>dname</td>
		<td>loc</td>
		<td>empno</td>
		<td>ename</td>
		<td>job</td>
		<td>mgr</td>
		<td>hiredate</td>
		<td>sal</td>
		<td>comm</td>
	</tr>
	<%for(int i=0;i<list.size();i++){ %>
		<%Dept dept=(Dept)list.get(i); %>
		<%List empList=dept.getEmpList(); %>
			<%for(int j=0;j<empList.size();j++){ %>
				<%Emp emp=(Emp)empList.get(j); %>
				<tr>
					<td><%= dept.getDeptno()%></td>
					<td><%= dept.getDname()%></td>
					<td><%= dept.getLoc()%></td>
					<td><%= emp.getEmpno()%></td>
					<td><%= emp.getEname()%></td>
					<td><%= emp.getJob()%></td>
					<td><%= emp.getMgr()%></td>
					<td><%= emp.getHiredate()%></td>
					<td><%= emp.getSal()%></td>
					<td><%= emp.getComm()%></td>
				</tr>
			<%} %>
		<%} %>
</table>