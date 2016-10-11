/*
 * Mybatis 의 설정정보를 담고 있는 xml을 읽어들여본다
 * 참고로 Mybatis  프레임웍은 응용,웹 모두에서 사용가능한
 * 중립적 라이브러리이다!!
 * */
package com.fashion.mybatis;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class MybatisConfigManager {
	public MybatisConfigManager() {
		String resource = "com/fashion/mybatis/config.xml";
		try {
			InputStream inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(inputStream);
			
			//세션을 얻어와 쿼리문을 수행해보자!
			SqlSession session=factory.openSession();
			List list=(List)session.selectList("com.fashion.product.domain.Product.selectAll");
			System.out.println(list.size());
			session.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	/*	
	public static void main(String[] args) {
		new MybatisConfigManager();
	}
	 */	
}









