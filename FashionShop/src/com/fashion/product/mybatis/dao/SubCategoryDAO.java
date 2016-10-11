package com.fashion.product.mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.fashion.mybatis.SessionManager;

public class SubCategoryDAO {
	SessionManager manager=SessionManager.getInstance();
	public List selectAll(int top_id){
		List list=null;
		SqlSession session=manager.getSession();
		
		list=session.selectList("SubCategory.selectAll", top_id);
		return list;
	}
}
