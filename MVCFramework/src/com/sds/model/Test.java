/*�ڹ��� �÷��� framework�� map�� �ڽ� ��ü��
 * properties��ü��, �о���� ������ key value�ϰ��
 * key ���� �̿��Ͽ� value�� �˻��� �� �ִ� �ɷ��� �ֵ�.
 * �� �ǽ��� json,xml���� �����͸� �����ϴ� ���¶�� ��� �����ϴ�*/
package com.sds.model;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

public class Test {
	FileInputStream fis;
	Properties props;
	public Test() {
		//�ϵ��ũ ���� �޸��忡 ���� ��ǲ ��Ʈ�� ��������
		String path="C:/jsp_workspace/MVCFramework/WebContent/WEB-INF/dispatcher-servlet.data";
		try {
			fis=new FileInputStream(path);
			props=new Properties();
			props.load(fis);
			//�� ���� ���� ������ ���� �� Ű�� ����� �̷���� ������ �����̶�� properties�� �ؼ��� �� �յ�.
			String value=props.getProperty("/movie.do");
			System.out.println(value);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void main(String[] args) {
		new Test();
		
	}

}
