/*
	�����̶�?? ���������� �ؼ� �� ����Ǵ� Ŭ������ �ǹ��Ѵ�.
*/
package com.site0920.test;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class  TestServlet extends HttpServlet
{
		//������ �����ֱ� �� �ν��Ͻ��� ������ ������ ������ �Ѱܹޱ� ���� ��������, �Ʒ��� init ȣ��
		//������ �ϻ��� �� �ѹ� ȣ�� ��(�¾ ���)
		//�����ڿʹ� Ʋ����. �� ������ ȣ��
		//ȣ�� ������ �����ڸ� �����ں��� �ʴ�.
		public void init(){
			System.out.println("�� ���� �� �¾���!!");
		}
		//������ servlet�� ������ ó���Ҷ� ȣ�� �Ǵ� �޼���
		//��, Ŭ���̾�Ʈ�� ��û�� ���ö����� ȣ��Ǵ� �޼���...
		//service �޼���� Ŭ���̾�Ʈ�� ��û�� ó���ؾ� ������ Ŭ���̾�Ʈ�� ��û�� ������ ������ �˾ƾ� �Ѵ�.
		//request ��ü, response ��ü�� �μ��� �޴´�.
		public void service(HttpServletRequest req,HttpServletResponse res){
			System.out.println("��û�� ó���ҰԿ�!!");
		}
		//servlet�� �ν��Ͻ��� �Ҹ�ɶ� �� �ѹ� ȣ�� �Ǵ� �޼���
		//���̻� ������� ���� �ڿ����� �ݳ��Ҷ� ����...
		public void destroy(){
			System.out.println("�� ���ϴ�.");
		}
}
