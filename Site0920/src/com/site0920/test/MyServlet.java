/*
	�������� �ǵ��� ��� ����, Ŭ���̾�Ʈ�� �������� �����Ҷ� �������� ����Ǵ� Ŭ������
	�Ƿ��� �ݵ�� �����̶�� javaEE�� api���� �����ϴ� Ŭ������ ��ӹ޾ƾ� �Ѵ�!!
	��, �����̶�? �������� ����Ǵ� �ڹ��� Ŭ����
*/
package com.site0920.test;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import java.io.IOException;
import java.io.PrintWriter;
public class  MyServlet extends HttpServlet{
	// �����ڰ� ���� Ŭ������ �������� ���� �� ��� , �� ���� ���� 
	//�� Ŭ������ ���������� ����� �� �ִ� Ŭ������ �ȴ�.
	//���� Ŭ���̾�Ʈ�� �������� �����Ҷ� ���� �ȴ�.
	//Ŭ���̾�Ʈ�� get������� ������ ��� �Ʒ��� �޼��尡 ���� �ȴ�.
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		//�������� ���ڿ��� ����� ����
		PrintWriter out=response.getWriter();
		out.print("<table width=\"width=200px border=1px\">");
		for(int i=1;i<=10;i++){
			out.print("<tr>");
			for(int j=1;j<=2;j++){
				out.print("<td>");
				out.print(11-i+"0"+j);
				out.print("</td>");
			}
			out.print("<tr>");
		}
		out.print("</table>");
	}
}
