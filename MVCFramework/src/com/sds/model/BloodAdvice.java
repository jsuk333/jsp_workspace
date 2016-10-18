/*웹이건 응용이건 영화에 대해 판단을 하는 로직 객체
 * 따라서 스윙(java SE) jsp(java EE) 모두에서 사용가능
 * */
package com.sds.model;

public class BloodAdvice {
	
	public String getAdvice(String blood){
		String msg=null;
		if(blood.equals("A")){
			msg="A형은 잘생기고 능력있고 최고의 피, 일도 잘함";
		}else if(blood.equals("B")){
			msg="B형은 고집세고, 주관도 세고 , 술도 세다";
		}else if(blood.equals("O")){
			msg="O형은 쓸데 없는 오지랖";
		}else if(blood.equals("AB")){
			msg="AB형은 오락가락 황제";
		}
		return msg;
	}
}
