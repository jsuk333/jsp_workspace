package com.fashion.emp;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.fashion.mybatis.SessionManager;

public class DeptDAO {
	SessionManager manager=SessionManager.getInstance();
	public List selectAll(){
		List list=null;
		SqlSession session=manager.getSession();
		list=session.selectList("Dept.selectAll");
		session.close();
		
		return list;
	}
}
