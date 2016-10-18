package com.sds.mybatis;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionManager {
	private static SqlSessionManager instance;
	private InputStream inputStream;
	private SqlSessionFactory sqlSessionFactory ;
	private SqlSessionManager() {
		String resource = "com/sds/mybatis/config.xml";
		try {
			inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public static SqlSessionManager getInstance(){
		if(instance==null){
			instance=new SqlSessionManager();
		}
		return instance;
	}
	public SqlSession getSession(){
		return sqlSessionFactory.openSession();
		
	}
}
