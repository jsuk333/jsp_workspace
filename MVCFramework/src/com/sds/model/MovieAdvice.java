/*웹이건 응용이건 영화에 대해 판단을 하는 로직 객체
 * 따라서 스윙(java SE) jsp(java EE) 모두에서 사용가능
 * */
package com.sds.model;

public class MovieAdvice {
	
	public String getAdvice(String movie){
		String msg=null;
		if(movie.equals("시빌워")){
			msg="마블의 걸작";
		}else if(movie.equals("부산행")){
			msg="한국판 좀비영화";
		}else if(movie.equals("럭키")){
			msg="유해진 주연 코메디";
		}else if(movie.equals("인페르노")){
			msg="다빈치 코드 3편";
		}
		return msg;
	}
}
