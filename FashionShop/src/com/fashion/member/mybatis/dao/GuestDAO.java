package com.fashion.member.mybatis.dao;

import org.apache.ibatis.session.SqlSession;

import com.fashion.member.domain.Guest;
import com.fashion.mybatis.SessionManager;

public class GuestDAO {
	SessionManager manager =SessionManager.getInstance();
	public int insert(Guest guest){
		SqlSession session=manager.getSession();
	
		session.insert("Guest.insert", guest);
		
		session.commit();
		session.close();
		return guest.getGuest_id();
	}
}
