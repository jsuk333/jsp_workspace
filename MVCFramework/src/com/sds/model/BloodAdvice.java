/*���̰� �����̰� ��ȭ�� ���� �Ǵ��� �ϴ� ���� ��ü
 * ���� ����(java SE) jsp(java EE) ��ο��� ��밡��
 * */
package com.sds.model;

public class BloodAdvice {
	
	public String getAdvice(String blood){
		String msg=null;
		if(blood.equals("A")){
			msg="A���� �߻���� �ɷ��ְ� �ְ��� ��, �ϵ� ����";
		}else if(blood.equals("B")){
			msg="B���� ��������, �ְ��� ���� , ���� ����";
		}else if(blood.equals("O")){
			msg="O���� ���� ���� ������";
		}else if(blood.equals("AB")){
			msg="AB���� �������� Ȳ��";
		}
		return msg;
	}
}
