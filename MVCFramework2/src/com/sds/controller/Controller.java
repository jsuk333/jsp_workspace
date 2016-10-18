/*모든 보조 컨트롤러들의 최상위 자료형을 정의 한다.
 * 1 구현을 강제 시킬 수 있다.
 * 2 앞으로 생성될 컨트롤러들의 자료형을 통일 시킬 수 있다.*/
package com.sds.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Controller {
	//모든 하위의 동생 컨트롤러들이 요청을 처리하기 위한 메서드
	public String execute(HttpServletRequest req,HttpServletResponse resp);
	//포워딩 여부를 결정하는 메서드
	public boolean isForward();
}
