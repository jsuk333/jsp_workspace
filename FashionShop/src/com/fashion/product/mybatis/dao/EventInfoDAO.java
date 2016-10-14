package com.fashion.product.mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.fashion.mybatis.SessionManager;

public class EventInfoDAO {
	SessionManager manager=SessionManager.getInstance();
	public List selectAll(){
		SqlSession session=manager.getSession();
		List list=session.selectList("EventInfo.selectAll");
		session.close();
		return list;
	}
}
