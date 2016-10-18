/*커맨드 패턴 적용시, 대왕 컨트롤러의 ;if 눈을 블럭을 없애려면
 * 커맨드 객체는 모두 같은 종류의 공통적 자료형으로 묶여있어야 한다.
 * 따라서 자바에서는 객체의 자료형을 같은 종류의 자료형으로 묶을 수 있는 방법은 바로 상속(extends,implements)*/
package com.sds.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Controller {
	public void execute(HttpServletRequest req,HttpServletResponse res);
}
