package com.fashion.product.mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.fashion.mybatis.SessionManager;
import com.fashion.product.domain.EventProduct;

public class EventProductDAO {
	SessionManager manager=SessionManager.getInstance();
	public int insert(List list){
		int result=0;
		SqlSession session=manager.getSession();
		try {
			for(int i=0;i<list.size();i++){
				EventProduct dto=(EventProduct)list.get(i);
				session.insert("EventProduct.insert", dto);
			}
			session.commit();
			result=1;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();
		}
		
		
		return result;
	}
}
